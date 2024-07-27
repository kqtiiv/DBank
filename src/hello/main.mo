import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Prelude "mo:base/Prelude";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  stable var startTime = Time.now();

  Debug.print(debug_show(startTime));


  let id = 239823085234;

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {
    if (amount <= currentValue) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("The amount is greater than the current value");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
};