<?php
// Quick script to check and fix category images in database
include 'include/functions/header.php';

echo "<h2>Current Categories in Database:</h2>";
echo "<table border='1' style='border-collapse: collapse; padding: 5px;'>";
echo "<tr><th>ID</th><th>Name</th><th>Current IMG Value</th><th>Status</th></tr>";

$result = $database->prepare("SELECT id, name, img FROM is_categories ORDER BY id");
$result->execute();
$categories = $result->fetchAll(PDO::FETCH_ASSOC);

foreach ($categories as $cat) {
    $img_path = "images/items/img_categorie/{$cat['img']}.png";
    $exists = file_exists($img_path);
    $status = $exists ? "<span style='color: green;'>✓ EXISTS</span>" : "<span style='color: red;'>✗ MISSING</span>";

    echo "<tr>";
    echo "<td>{$cat['id']}</td>";
    echo "<td>{$cat['name']}</td>";
    echo "<td>{$cat['img']}</td>";
    echo "<td>{$status}</td>";
    echo "</tr>";
}

echo "</table>";

echo "<h3>Available Images:</h3>";
$images = glob("images/items/img_categorie/*.png");
echo "<ul>";
foreach ($images as $img) {
    $name = basename($img, '.png');
    echo "<li>$name</li>";
}
echo "</ul>";
?>
