import UIKit

class SquaresView: UIView {
    
    var squareSize: CGFloat = 2

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupSquares() {
        let bigSquareSize = min(bounds.width / squareSize, bounds.height / squareSize)
        let bigSquareFrame = CGRect(x: (bounds.width - bigSquareSize) / 2,
                                    y: (bounds.height - bigSquareSize) / 2,
                                    width: bigSquareSize,
                                    height: bigSquareSize)
        
        let bigSquareLayer = CALayer()
        bigSquareLayer.frame = bigSquareFrame
        print("🍎", #function, bigSquareFrame)
        bigSquareLayer.backgroundColor = UIColor.lightGray.cgColor
        layer.addSublayer(bigSquareLayer)

        let padding: CGFloat = 4
        let smallSquareSize = (bigSquareSize - padding * 3) / 2
        
        let colors: [UIColor] = [.red, .blue, .orange, .green]
        
        for (index, color) in colors.enumerated() {
            let row = index / 2
            let col = index % 2
            
            let x = padding + CGFloat(col) * (smallSquareSize + padding)
            let y = padding + CGFloat(row) * (smallSquareSize + padding)
            
            let smallSquareLayer = CALayer()
            smallSquareLayer.frame = CGRect(x: x, y: y, width: smallSquareSize, height: smallSquareSize)
            smallSquareLayer.backgroundColor = color.cgColor
            bigSquareLayer.addSublayer(smallSquareLayer)
        }
    }
    
    func changeSize() {
        if squareSize == 4 {
            layer.sublayers = nil
            squareSize = 1
            setupSquares()
        } else {
            layer.sublayers = nil
            squareSize += 1
            setupSquares()
        }
    }
}
