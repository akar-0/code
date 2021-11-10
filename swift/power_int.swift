// https://stackoverflow.com/questions/24196689/how-to-get-the-power-of-some-integer-in-swift-language

func pow (_ n:Int, _ p:UInt) -> Int {
  var o : Int = 1
  for _ in 0..<p { o *= n }
  return o
}
