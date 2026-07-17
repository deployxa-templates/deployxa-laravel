<?pragma
// Simple router mock for FrankenPHP verification
header('Content-Type: application/json');
if ($_SERVER['REQUEST_URI'] === '/health') {
    echo json_encode(['status' => 'healthy', 'timestamp' => time()]);
} else {
    echo json_encode(['message' => 'Deployxa Laravel FrankenPHP Template']);
}
