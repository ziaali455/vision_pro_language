import SwiftUI

struct TranslationView: View {
    @State private var sourceLanguageIndex = 0
    @State private var targetLanguageIndex = 1
    @State private var inputText = ""
    @State private var outputText = ""

    let languages = ["Turkish", "English", "German", "French", "Spanish", "Italian", "Russian", "Chinese", "Arabic", "Japanese"]
  
    var body: some View {
        ScrollView {
            VStack{
                ZStack{
                    Color("color")
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        
                        HStack{
                            Picker("Source Language:", selection: $sourceLanguageIndex) {
                                ForEach(0..<languages.count, id: \.self) { index in
                                   Text(languages[index])
                                     
                                  
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding()
                            
                            Image(systemName: "arrow.left.arrow.right")
                            .frame(width: 20, height: 20)
                            
                            
                            Picker("Target Language:", selection: $targetLanguageIndex) {
                                ForEach(0..<languages.count, id: \.self) { index in
                                    Text(languages[index])
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding()
                            
                        }
                        
                        HStack{
                            
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 373, height: 208)
                                    .background(Color(red: 0.14, green: 0.15, blue: 0.15))
                                    .cornerRadius(22)
                                VStack{
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 351.00143, height: 1)
                                        .background(.white.opacity(0.33))
                                        .offset(y: 55)
                                    
                                    HStack{
                                        Text("0/500")
                                            .font(Font.custom("Inter", size: 20))
                                            .foregroundColor(.white.opacity(0.43))
                                            .offset(x: -90, y: 60)
                                        
                                        Image(systemName: "pencil.line")
                                            .frame(width: 18, height: 18)
                                            .foregroundColor(.white)
                                            .offset(x: 90, y: 60)
                                        
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: 1, height: 18.02776)
                                            .background(.white.opacity(0.43))
                                            .offset(x: 90, y: 60)
                                        
                                        Image(systemName: "speaker.wave.2.fill")
                                            .frame(width: 15, height: 15)
                                            .foregroundColor(.white)
                                            .offset(x: 100, y: 60)
                                    }
                                    
                                }
                                
                                TextField("Enter Text", text: $inputText)
                                    .font(
                                        Font.custom("Inter", size: 17)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(.white)
                                    .offset(x: -80, y: -65)
                                    .frame(width: 150)
                            }
                            
                            
                            
                            Button("Translate", action: translateText)
                                .padding(20)
                            
                            VStack{
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 373, height: 208)
                                        .background(Color(red: 0.14, green: 0.15, blue: 0.15))
                                        .cornerRadius(22)
                                    VStack{
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: 351.00143, height: 1)
                                            .background(.white.opacity(0.33))
                                            .offset(y: 55)
                                        
                                        HStack{
                                            Text("0/500")
                                                .font(Font.custom("Inter", size: 20))
                                                .foregroundColor(.white.opacity(0.43))
                                                .offset(x: -90, y: 60)
                                            
                                            Image(systemName: "pencil.line")
                                                .frame(width: 18, height: 18)
                                                .foregroundColor(.white)
                                                .offset(x: 90, y: 60)
                                            
                                            Rectangle()
                                                .foregroundColor(.clear)
                                                .frame(width: 1, height: 18.02776)
                                                .background(.white.opacity(0.43))
                                                .offset(x: 90, y: 60)
                                            
                                            Image(systemName: "speaker.wave.2.fill")
                                                .frame(width: 15, height: 15)
                                                .foregroundColor(.white)
                                                .offset(x: 100, y: 60)
                                        }
                                        
                                    }
                                    
                                    TextField("Enter Text", text: $outputText)
                                        .font(
                                            Font.custom("Inter", size: 17)
                                                .weight(.medium)
                                        )
                                        .foregroundColor(.white)
                                        .offset(x: -80, y: -65)
                                        .frame(width: 150)
                                }
                                
                                
                            }
                        }
                    }
                    .padding()
                    
                }
            }
        }
       
    }

    func translateText()  {
        let sourceLanguage = languages[sourceLanguageIndex]
        let targetLanguage = languages[targetLanguageIndex]

        // Here you should call a real translation API to perform the translation.
        // This is just a simple example. You will need to integrate a real translation service.
//        translateWithAPI(inputText: inputText, sourceLanguage: sourceLanguage, targetLanguage: targetLanguage)
        translateWithAPI(inputText: inputText, sourceLanguage: sourceLanguage, targetLanguage: targetLanguage)
        
    }

//    func translateWithAPI(inputText: String, sourceLanguage: String, targetLanguage: String) {
//        // Here you should call a real translation API to perform the translation.
//        // This is just a simple example. You will need to integrate a real translation service.
//        // We are using a simple dictionary for an example translation:
//        let translations = [
//            "hola": "hello",
//            "adiós": "goodbye",
//            "gracias": "thank you",
//            "por favor": "please",
//            "amigo": "friend",
//            "casa": "house",
//            "gato": "cat",
//            "perro": "dog",
//            "agua": "water",
//            "comida": "food"
//        ]
//        guard let outputText = translations[inputText.lowercased()] else {
//                outputText = "None"
//            }
//        
//    }
    func translateWithAPI(inputText: String, sourceLanguage: String, targetLanguage: String) {
        let translations = [
                    "hola": "hello",
                    "adiós": "goodbye",
                    "gracias": "thank you",
                    "por favor": "please",
                    "amigo": "friend",
                    "casa": "house",
                    "gato": "cat",
                    "perro": "dog",
                    "agua": "water",
                    "comida": "food"
                ]
        if let translatedText = translations[inputText.lowercased()] {
            outputText = translatedText
        } else {
            outputText = "None"
        }
    }
}

struct TranslationView_Previews: PreviewProvider {
    static var previews: some View {
        TranslationView()
            .preferredColorScheme(.dark)
    }
}
