import java.util.HashMap;
import java.util.Map;

public class ChessBoardMap {

	private Map<String, ChessField> visitedChessFields;
	private String targetField = "";
	private int shortestPath = -1;
	
	public ChessBoardMap(int x, int y) {
		visitedChessFields = new HashMap<>();
		targetField = calculateFieldName(x, y);
	}
	
	public void addChessField(ChessField chessField) {
		visitedChessFields.put(chessField.getName(), chessField);
	}
	
	public ChessField getChessFieldState(ChessField chessField) {
		int x = chessField.getX();
		int y = chessField.getY();
		
		String chessFieldName = calculateFieldName(x, y);
		return visitedChessFields.get(chessFieldName);
	}
			
	public String getTargetField() {
		return targetField;
	}
	
	private String calculateFieldName(int x, int y) {
		return Character.toString(((char)((x-1) + 'A'))) + y;
	}

	public int getShortestPath() {
		return shortestPath;
	}

	public void setShortestPath(int shortestPath) {
		this.shortestPath = shortestPath;
	}
}
