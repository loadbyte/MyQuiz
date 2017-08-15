<?php
session_start();
require '.././libs/Slim/Slim.php';
require_once 'dbHelper.php';

\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();
$app = \Slim\Slim::getInstance();
$db = new dbHelper();

/**
 * Database Helper Function templates
 */
/*
select(table name, where clause as associative array)
insert(table name, data as associative array, mandatory column names as array)
update(table name, column names as associative array, where clause as associative array, required columns as array)
delete(table name, where clause as array)
*/



$app->get('/rsoptions/:exam_tk', function($exam_tk) { 
    global $db;
	$condition = array('ex_tk_id'=>$exam_tk);
    $rows = $db->select("exam_qa","ex_qa_id,ques_id,option_id",$condition);
	$rows1 = $db->select("exam_taken","exam_id,score",$condition);
	$exam_id = $rows1["data"][0]["exam_id"];
	$rows2 = $db->sqlstmt("Select ques_id, option_id from answers where ques_id in ( select ques_id from questions where exam_id = $exam_id)");
	$rows3 = $db->sqlstmt("Select ques_id, option_id,option_content from options  where ques_id in ( select ques_id from questions where exam_id = $exam_id)");
	$condition = array('exam_id'=>$exam_id);
    $rows4 = $db->select("questions","ques_id,question,difficulty,exam_id,question_ts, weight, 0 as status",$condition);
	$questions = array();
	$arr = array();
	foreach($rows3["data"] as $options){
		if (!array_key_exists($options["ques_id"],$arr)){
			$arr[$options["ques_id"]] = array();
			$arr[$options["ques_id"]][$options["option_id"]] = $options["option_content"];
		} else {
			$arr[$options["ques_id"]][$options["option_id"]] = $options["option_content"];
		} 
	}
	
	$arr_ans = array();
	foreach($rows2["data"] as $answer){
		$arr_ans[$answer["ques_id"]] = $answer["option_id"];
	}
	
	$arr_given = array();
	foreach($rows["data"] as $given){
		$arr_given[$given["ques_id"]] = $given["option_id"];
	}
	
	$arr_quess = array();
	foreach($rows4["data"] as $quess){
		$arr_quess[$quess["ques_id"]] = $quess["question"];
	}
	foreach($arr as $ques_id => $options){
		$tmp = array();
		if (array_key_exists( $ques_id,$arr_ans)){
			$tmp["correct"] = $arr_ans[$ques_id];
		}
		if (array_key_exists( $ques_id,$arr_given)){
			$tmp["given"] = $arr_given[$ques_id];
		}
		if (array_key_exists( $ques_id,$arr_quess)){
			$tmp["question"] = $arr_quess[$ques_id];
		}
		$tmp["options"] = $options;
		$questions[$ques_id] = $tmp;
	}
	$rows3["data"] = $questions;
    echoResponse(200, $rows3);
});

$app->get('/questions/:exam', function($exam) { 
    global $db;
	$condition = array('exam_id'=>$exam);
    $rows = $db->select("questions","ques_id,question,difficulty,exam_id,question_ts, weight, 0 as status",$condition);
    echoResponse(200, $rows);
});

$app->get('/examscore/:exam', function($exam) { 
    global $db;
	$condition = array('exam_id'=>$exam);
    $rows = $db->select("questions","sum(weight) as maxscore",$condition);
    echoResponse(200, $rows);
});

$app->get('/myanswers/:exam_tk', function($exam_tk) { 
    global $db;
	$condition = array('ex_tk_id'=>$exam_tk);
    $rows = $db->select("exam_qa","ex_qa_id,ques_id,option_id",$condition);
    echoResponse(200, $rows);
});
$app->get('/questions_ans/:exam', function($exam) { 
    global $db;
	$condition = array('exam_id'=>$exam, 'q.ques_id'=>'a.ques_id');
    $rows = $db->sqlstmt("select q.ques_id,question,q.difficulty,q.exam_id,q.question_ts, q.weight, 0 as status ,a.option_id from questions as q, answers as a where q.ques_id = a.ques_id and exam_id = ".$exam);
    echoResponse(200, $rows);
});
$app->get('/myresults', function() { 
    global $db;
    $rows = $db->sqlstmt("select tk.ex_tk_id,e.exam_id,e.exam_name,tk.score,tk.completed,tk.ex_tk_ts as ts from exams as e, exam_taken as tk where e.exam_id = tk.exam_id and user_id = ".$_SESSION['uid']);
    echoResponse(200, $rows);
});
$app->get('/exams/:ex_tk_id', function($ex_tk_id) { 
    global $db;
	$condition = array('ex_tk_id'=>$ex_tk_id,'user_id'=>$_SESSION['uid']);
    $rows = $db->select("exam_taken","exam_id,score,completed",$condition);
    echoResponse(200, $rows);
});
$app->get('/exams', function() { 
    global $db;
    $rows = $db->select("exams","exam_id,exam_name, description,exam_points,group_id,exam_ts, 0 as status",array());
    echoResponse(200, $rows);
});

$app->get('/exam_details/:exam_id', function($exam_id) { 
    global $db;
	$condition = array('exam_id'=>$exam_id);
    $rows = $db->select("exams","exam_name,exam_id, group_id",$condition);
    echoResponse(200, $rows);
});
$app->get('/options/:ques_id', function($ques_id) { 
    global $db;
	$condition = array('ques_id'=>$ques_id);
    $rows = $db->select("options","option_id,option_content,ques_id,option_ts",$condition);
    echoResponse(200, $rows);
});
$app->post('/answer', function() use ($app) { 
    $data = json_decode($app->request->getBody(),true);
    global $db;
	$condition = array('ex_tk_id'=>$data['ex_tk_id'], 'ques_id'=>$data['ques_id'] );
	$rows = $db->select("exam_qa","ex_tk_id",$condition);
	 if($rows["status"] == "warning"){
	    $condition = array('ex_tk_id'=>$data['ex_tk_id'], 'ques_id'=>$data['ques_id'] );
		//$mandatory = array('ex_tk_id', 'ques_id', 'option_id');
		$mandatory = array();
		$condition_ques = array('ques_id'=>$data['ques_id'],'option_id'=>$data['option_id']);
		$rows = $db->select("answers","option_id",$condition_ques);
		if($rows["status"]=="success"){
			$data['score'] = $data['weight'];
		} else {
			$data['score'] = 0;
		}
		unset($data['weight']);
		$rows2 = $db->insert("exam_qa", $data, $mandatory);
		if($rows2["status"]=="success")
			$rows2["message"] = "Score inserted successfully.";
		echoResponse(200, $rows2);
	 } else{
		$condition = array('ex_tk_id'=>$data['ex_tk_id'], 'ques_id'=>$data['ques_id'] );
		//$mandatory = array('option_id', 'score');
		$mandatory = array();
		$condition_ques = array('ques_id'=>$data['ques_id'],'option_id'=>$data['option_id']);
		$rows = $db->select("answers","option_id",$condition_ques);
		if($rows["status"]=="success"){
			$data['score'] = $data['weight'];
		} else {
			$data['score'] = 0;
		}
		unset($data['weight']);
		$rows2 = $db->update("exam_qa", $data, $condition, $mandatory);
		if($rows2["status"]=="success")
			$rows2["message"] = "Score updated successfully.";
		echoResponse(200, $rows2);
	 }
    
});
$app->post('/exam_taken', function() use ($app) { 
    $data = json_decode($app->request->getBody(),true);
    $mandatory = array();
	$user_id = $_SESSION['uid'];
	$data["user_id"]=$user_id;
    global $db;
    $rows = $db->insert("exam_taken", $data , $mandatory);
    if($rows["status"]=="success")
        $rows["message"] = "exam taken successfully.";
    echoResponse(200, $rows);
});

$app->post('/exam_comp', function() use ($app) { 
    $data = json_decode($app->request->getBody(),true);
    $mandatory = array();
	$condition = array('ex_tk_id'=>$data['ex_tk_id']);
	$set_data = array("completed"=>1);
    global $db;
	$rows_qa = $db->select("exam_qa","sum(score) as totalscore",$condition);
	if($rows_qa["status"]=="success"){
		$data_rs = $rows_qa['data'];
		$set_data["score"] = $data_rs[0]['totalscore'];
	}
    $rows = $db->update("exam_taken", $set_data , $condition, $mandatory);
    if($rows["status"]=="success")
        $rows["message"] = "exam completed successfully.";
    echoResponse(200, $rows);
});

$app->put('/questions/:id', function($id) use ($app) { 
    $data = json_decode($app->request->getBody());
    $condition = array('id'=>$id);
    $mandatory = array();
    global $db;
    $rows = $db->update("questions", $data, $condition, $mandatory);
    if($rows["status"]=="success")
        $rows["message"] = "Product information updated successfully.";
    echoResponse(200, $rows);
});

$app->delete('/questions/:id', function($id) { 
    global $db;
    $rows = $db->delete("questions", array('id'=>$id));
    if($rows["status"]=="success")
        $rows["message"] = "Product removed successfully.";
    echoResponse(200, $rows);
});

function echoResponse($status_code, $response) {
    global $app;
    $app->status($status_code);
    $app->contentType('application/json');
    echo json_encode($response,JSON_NUMERIC_CHECK);
}

$app->run();
?>