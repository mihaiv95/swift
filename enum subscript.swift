
import Foundation

class t_note_student{
    var note: [String: Int]
    
    init(){
        note = [:]
    }
    
    init(_ materie: String, _ nota: Int){
        note = [materie: nota]
    }
    
    deinit{
        note = [:]
    }
    
    func adauga(_ materie: String, _ nota: Int){
        note[materie] = nota
    }
    
    func actualizare(_ materie: String, _ nota: Int){
        note[materie] = nota
    }
    
    func tiparire(){
        print("Lista note este = ")
        for (materie, nota) in note{
            print("Pentru materia \(materie) nota este \(nota)")
        }
    }
    
    func tiparire_restante(){
        print("Lista restante este = ")
        for (materie, nota) in note{
            if nota < 5 {
                print("Pentru materia \(materie) nota este \(nota)")
            }
        }
    }
    
    func calculeaza_media()->Float{
        var media: Float
        media = 0
        for nota in note.values{
            media += Float(nota)
        }
        media = media / Float(note.count)
        return media
    }
    
    func sterge_nota(_ materie : String){
        note[materie] = nil
    }
    
    func gaseste_nota(_ materie: String) -> Int{
        if let nota = note[materie]{
            return nota
        }
        return -1
    }
    
    subscript(index: String)->Int{
        get{
            return gaseste_nota(index)    
        }
        set(nota_noua){
            note[index] = nota_noua    
        }
    }
}// end class

enum lista_teste {
    case adauga
    case restante
    case medie
    case sterge
    case cauta
    case test_subscript
}

var test = lista_teste.test_subscript

switch test{
    case .adauga:
        let note_student = t_note_student()
        note_student.adauga("app", 10)
        note_student.adauga("ia", 4)
        note_student.tiparire()

    case .restante:
        let note_student = t_note_student()
        note_student.adauga("app", 10)
        note_student.adauga("ia", 4)
        note_student.tiparire_restante()
    
    case .medie:
        let note_student = t_note_student()
        note_student.adauga("app", 10)
        note_student.adauga("ia", 4)
        let media = note_student.calculeaza_media()
        print("Media este = \(media)")
    
    case .sterge:
        let note_student = t_note_student()
        note_student.adauga("app", 10)
        note_student.adauga("ia", 4)
        note_student.sterge_nota("app")
        note_student.tiparire()
    
    case .cauta:
        let note_student = t_note_student()
        note_student.adauga("app", 10)
        note_student.adauga("ia", 4)
        let materie_cautata = "ia"
        let nota = note_student.gaseste_nota(materie_cautata)
        if nota > -1{
            print("Nota la \(materie_cautata) este \(nota)")
        }
        else{
            print("Nu avem nota la \(materie_cautata)")
        }
        
    case .test_subscript:
        let note_student = t_note_student()
        note_student["poo"] = 10
        print(note_student["poo"])
}
