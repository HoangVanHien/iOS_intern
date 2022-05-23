import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle ?? "Blank Sound")
        blinkButton(sender, fadeDuration: 0.2)
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    func blinkButton(_ button: UIButton, fadeDuration: Double){
        button.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + fadeDuration) {
            button.alpha = 1
        }
    }
}
