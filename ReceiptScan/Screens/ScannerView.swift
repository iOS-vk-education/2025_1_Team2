
import SwiftUI

struct ScannerView: View {
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            VStack {
                Spacer()
                    .frame(height: 60)
                ZStack {
                    Rectangle()
                        .fill(Color.black.opacity(0.5))
                        .frame(maxWidth: .infinity, maxHeight: 600)
                        .overlay(
                            Text("Наведите камеру на чек")
                                .foregroundColor(.black)
                                .font(.headline)
                        )
                    CornerBrackets()
                        .stroke(Color.blue, lineWidth: 3)
                        .frame(width: 350, height: 580)
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                HStack(spacing: 80) {
                    Button {
                    } label: {
                        Text("Отмена")
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                    }

                    Button {
                    } label: {
                        Text("Готово")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                    }

                    Button {
                    } label: {
                        Text("Альбом")
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                    }
                }
                .padding(.bottom, 20)
                
            }
        }
    }
}

struct CornerBrackets: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let cornerLength: CGFloat = 40
        
        path.move(to: CGPoint(x: 0, y: cornerLength))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: cornerLength, y: 0))
        
        path.move(to: CGPoint(x: rect.maxX - cornerLength, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: cornerLength))
        
        path.move(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerLength))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - cornerLength, y: rect.maxY))
        
        path.move(to: CGPoint(x: cornerLength, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY - cornerLength))
        
        return path
    }
}


#Preview {
    ScannerView()
}
