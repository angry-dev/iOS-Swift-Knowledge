import UIKit

/*:
 ### Class
 - 참조타입
 - ARC로 메모리 관리를 한다.
 - 같은 클래스 인스턴스를 여러개의 변수에 할당한 뒤 값을 변경시키면 할당한 모든 변수에 영향을 준다.(메모리만 복사)
 - 상속이 가능하다
 - 타입 캐스팅을 통해 런타임에서 클래스 인스턴스의 타입을 확인 할 수 있다.
 - deinit을 사용하여 클래스 인스턴스의 메모리 할당을 해제할 수 있다.
 */

class SampleClass {
    var count: Int = 0
    
    deinit {
        print("할당 해제")
    }
}

var class1 = SampleClass()
var class2 = class1
var class3 = class1

class3.count = 3

// class3의 값을 변경했지만 참조타입이므로 class1도 변경 된다.
print(class3.count)


/*:
 ### Struct
 - 값 타입
 - 구조체 변수를 새로운 변수에 할당할 때 마다 새로운 구조체가 할당된다.
 - 즉, 같은 구조체. 여러개의 변수에 할당한 뒤 값을 변경시키더라도 다른 변수에 영향을 주지 않는다.(값 자체를 복사)
 */

struct SampleStruct {
    var count: Int = 0
}

var struct1 = SampleStruct()
var struct2 = struct1
var struct3 = struct1

struct2.count = 2
struct3.count = 3

// 구조체는 값 타입이므로 항상 새로운 메모리에 할당된다.
print(struct1.count) // 0
print(struct2.count) // 2
print(struct3.count) // 3


//: ### ARC
var classARC1: SampleClass? = SampleClass()
print(CFGetRetainCount(classARC1)) // 변수에 할당한 객체의 경우 2가 기본 값

var classARC2 = classARC1
print(CFGetRetainCount(classARC1)) // 참조 카운트가 1 증가한 3이된다.

classARC1 = nil
print(CFGetRetainCount(classARC2)) // 참조 카운트가 1 감소하여 2가 된다.
classARC2 = nil // 참조카운트가 1 감소하여 더이상 참조하는 곳이 없으므로 deinit이 실행된다.
