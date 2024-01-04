# Custom Intro (with. UINavigationContoller)
UINavigationController를 사용하여 Custom Intro 만들기

https://github.com/SuniDev/CustomIntro-UINavigationController/assets/56523702/59d79322-3e13-404d-ae3c-b3a30dc6e2d5

## 만드는 방법
## 1. LaunchScreen.storyboard

![image](https://github.com/SuniDev/CustomIntro-UINavigationController/assets/56523702/4bba15b0-6553-4f4b-89e2-fc530a53144f)
먼저 LaunchScreen 을 작업합니다.
저는 인트로 화면과 런치 스크린을 똑같이 그렸습니다.
<br><br>


## 2. 인트로 화면 생성 및 설정 1 - Intro.storyboard

![image](https://github.com/SuniDev/CustomIntro-UINavigationController/assets/56523702/fe53eb6e-01ce-4f04-8566-87bd1c41747a)
Intro 화면을 작업할 스토리보드를 생성합니다. 
<br>

![image](https://github.com/SuniDev/CustomIntro-UINavigationController/assets/56523702/406dbc13-1694-4429-9d92-b498b3ad8b10)
Intro.storyboard에 ViewController를 추가하여<br>
인트로 화면을 원하는 대로 커스텀 합니다.
<br><br>


## 3. 인트로 화면 생성 및 설정 2 - IntroVC.swift

![image](https://github.com/SuniDev/CustomIntro-UINavigationController/assets/56523702/4522868b-c60a-4487-8926-33d8d2cc2c71)
![image](https://github.com/SuniDev/CustomIntro-UINavigationController/assets/56523702/0b142dd8-56d6-41e2-b949-9d5a10b6c17e)
인트로 화면 기능을 수행해 줄 UIViewController를 상속받는 IntroVC 클래스를 생성합니다.
<br>

![image](https://github.com/SuniDev/CustomIntro-UINavigationController/assets/56523702/28ab000b-85cf-4bb0-9a40-e56fa7a48101)
Intro.storybaord > ViewController 선택 > ![image]({{ site.url }}{{ site.baseurl }}/assets/images/210405/icon4-white.png) > Custom Class > IntroVC 입력 <br>
Identity > Storyboard ID > IntroVC 입력<br>
Use Storyboard ID를 체크합니다.
<br><br>


## 4. AppDelegate.swift


```swift
var navigationVC: UINavigationController?
```
AppDelegate.swift > UINavigationController를 선언합니다.
<br>

```swift
extension AppDelegate {
    /**
     # initNavigationVC
     - Author: suni
     - Date:
     - Note: Root Navigation 초기화
    */
    func initNavigationVC() {
        self.navigationVC = UINavigationController()
        self.navigationVC?.isNavigationBarHidden = true
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Intro", bundle: nil)
        let introVC = storyBoard.instantiateViewController(withIdentifier: "IntroVC") as! IntroVC
        self.navigationVC?.setViewControllers([introVC], animated: false)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = navigationVC
        self.window!.makeKeyAndVisible()
    }
}
```
AppDelegate extension 을 선언하여, 루트 내비게이션을 초기화하는 함수를 생성합니다.
<br>

```swift 
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    // Root Navigation 초기화
    self.initNavigationVC()

    return true
}
```
AppDelegate.swift > didFinishLaunchingWithOptions에 생성한 내비게이션 초기화 함수를 호출합니다.
<br><br>


## 5. 메인 화면 생성 및 설정 1 - Main.storyboard


![image](https://github.com/SuniDev/CustomIntro-UINavigationController/assets/56523702/f3a3196a-97f7-4268-8c86-5fcc57e31773)
Main.storyboard에 메인 화면을 원하는 대로 커스텀 합니다.
<br><br>


## 6. 메인 화면 생성 및 설정 2 - MainVC.swift


![image](https://github.com/SuniDev/CustomIntro-UINavigationController/assets/56523702/a0608a87-ab77-4b60-a281-2f5498b5ffc0)
![image](https://github.com/SuniDev/CustomIntro-UINavigationController/assets/56523702/de0db6b9-c825-459b-a9a5-bb7934804813)
메인 화면 기능을 수행해 줄 UIViewController를 상속받는 MainVC 클래스를 생성합니다.

![image](https://github.com/SuniDev/CustomIntro-UINavigationController/assets/56523702/463429f9-dd6a-4f4d-bce9-b9044b6d7a4d)
Main.storybaord > ViewController 선택 > ![image](https://github.com/SuniDev/CustomIntro-UINavigationController/assets/56523702/0aca0c52-5b6b-44d0-8f73-fcc60dea0cad) > Custom Class > MainVC 입력 <br>
Identity > Storyboard ID > MainVC 입력<br>
Use Storyboard ID를 체크합니다.
<br><br>


## 7. IntroVC.swift


```swift
extension IntroVC {
    /**
     # moveMain
     - Author: suni
     - Date:
     - Note: 메인 화면 이동
    */
    func moveMain() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MainVC") as! MainVC
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let transition: CATransition = CATransition()
            transition.duration = 0.4
            transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            transition.type = .fade
            appDelegate.navigationVC?.view.layer.add(transition, forKey: nil)
            
            appDelegate.navigationVC?.setViewControllers([vc], animated: false)
        }
        
    }
}
```
IntroVC extension 을 선언하여, AppDelegate의 naviagtionVC를 이용한 메인 화면(MainVC)로 이동하는 함수를 생성합니다.
<br>

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    let time = DispatchTime.now() + 2.0
    DispatchQueue.main.asyncAfter(deadline: time) {
        self.moveMain()
    }
}
```
IntroVC.swift > viewDidLoad() 내에서 메인 화면 이동 함수를 호출합니다.
<br>

위 코드는 2.0초 뒤에 인트로 화면 > 메인 화면으로 전환하는 코드입니다.<br>
만약 인트로에서 메인 화면 데이터 불러오기, 버전 체크 등 필수로 처리해야 할 일이 있으면 완료 후, 메인 화면으로 이동하는 로직도 있습니다.
{: .notice--primary}

<br><br>
