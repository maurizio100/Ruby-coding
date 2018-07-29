import java.util.List;

public class Main {

	public static void main(String[] args) {
		ChessBoardMap memoryMap = new ChessBoardMap(8,1);
		ChessField startField = new ChessField(1, 1);

		List<ChessField> solution = startField.move(memoryMap);
		
		for(int i = (solution.size()-1); i >= 0; i--) {
			System.out.print(solution.get(i));
		}
	}
}
