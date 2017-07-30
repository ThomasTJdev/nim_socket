import asyncnet, asyncdispatch, os

proc main() {.async.} =
  var client = newAsyncSocket()
  await client.connect("localhost", Port(12345))
  
  while true:
    await client.send("Alarm" & "\r\L")
    let response = await client.recvLine()
    echo "Received: " & response & "!"
    sleep(2000)

waitFor main()
