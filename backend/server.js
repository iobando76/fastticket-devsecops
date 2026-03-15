import http from "http";

const PORT = process.env.PORT || 5000;

const requestHandler = (req, res) => {
  if (req.url === "/" || req.url === "/health") {
    res.writeHead(200, { "Content-Type": "application/json" });
    res.end(
      JSON.stringify({
        status: "ok",
        service: "fastticket-backend",
        environment: process.env.NODE_ENV || "development",
      })
    );
    return;
  }

  res.writeHead(404, { "Content-Type": "application/json" });
  res.end(
    JSON.stringify({
      error: "Not found",
    })
  );
};

const server = http.createServer(requestHandler);

server.listen(PORT, "0.0.0.0", () => {
  console.log(`FastTicket backend running on port ${PORT}`);
});
