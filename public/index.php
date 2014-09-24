<?php
require_once "../vendor/autoload.php";

$dsn = "mysql:dbname=protocolos;host=localhost";
$username = "root";
$password = "";

$pdo = new PDO($dsn, $username, $password);
$db = new NotORM($pdo);

$app = new Slim(array(
    "MODE" => "development",
    "TEMPLATES.PATH" => "./templates"
));

$app->get("/", function() {
    echo "<h1>Hello Slim World</h1>";
});

$app->get("/empresas", function () use ($app, $db) {
    foreach ($db->empresa() as $empresa) {
		$empresas[]  = array(
            "id" => $empresa["id"],
            "nome" => $empresa["nome"],
            "descricao" => $empresa["descricao"],
            "telefone" => $empresa["telefone"]
        );
    }
    $app->response()->header("Content-Type", "application/json");
    echo json_encode($empresas);
});


$app->get("/empresa/:id", function ($id) use ($app, $db) {
    $app->response()->header("Content-Type", "application/json");
    $empresa = $db->empresa()->where("id", $id);
    if ($data = $empresa->fetch()) {
        echo json_encode(array(
			"id" => $data["id"],
			"nome" => $data["nome"],
			"descricao" => $data["descricao"],
			"telefone" => $data["telefone"]
            ));
    }
    else{
        echo json_encode(array(
            "status" => false,
            "message" => "Não existe um livro com o ID $id"
            ));
    }
});

$app->post("/book", function () use($app, $db) {
    $app->response()->header("Content-Type", "application/json");
    $book = $app->request()->post();
    $result = $db->books->insert($book);
    echo json_encode(array("id" => $result["id"]));
});

$app->put("/book/:id", function ($id) use ($app, $db) {
    $app->response()->header("Content-Type", "application/json");
    $book = $db->books()->where("id", $id);
    if ($book->fetch()) {
        $post = $app->request()->put();
        $result = $book->update($post);
        echo json_encode(array(
            "status" => (bool)$result,
            "message" => "Book updated successfully"
            ));
    }
    else{
        echo json_encode(array(
            "status" => false,
            "message" => "Book id $id does not exist"
        ));
    }
});

$app->delete("/book/:id", function ($id) use($app, $db) {
    $app->response()->header("Content-Type", "application/json");
    $book = $db->books()->where("id", $id);
    if ($book->fetch()) {
        $result = $book->delete();
        echo json_encode(array(
            "status" => true,
            "message" => "Book deleted successfully"
        ));
    }
    else{
        echo json_encode(array(
            "status" => false,
            "message" => "Book id $id does not exist"
        ));
    }
});

$app->run();
