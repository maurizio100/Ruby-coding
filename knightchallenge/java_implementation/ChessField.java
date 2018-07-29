import java.util.ArrayList;
import java.util.List;

public class ChessField {

	private String name;
	private int movesNeeded = -1, x, y;

	public ChessField(int x, int y) {		
		name = Character.toString(((char)((x-1) + 'A'))) + y;
		this.x = x;
		this.y = y;
	}

	public List<ChessField> move(ChessBoardMap memory) {
		return move(memory, 0);
	}
	
	private List<ChessField> move(ChessBoardMap memory, int moveCount) {
		if(memory.getShortestPath() != -1 && moveCount >= memory.getShortestPath()) {
			return new ArrayList<>();
		}
		
		this.movesNeeded = moveCount;
		memory.addChessField(this);

		String targetField = memory.getTargetField();
		if(isTargetNode(targetField)) {
			System.out.println("Found solution! Moves: " + moveCount);
			List<ChessField> solutionField = new ArrayList<>();
			solutionField.add(this);
			
			memory.setShortestPath(moveCount);
			return solutionField;
		}
		
		List<ChessField> possibleMoves = calculatePossibleMoves(memory);
		
		if(!possibleMoves.isEmpty()) {
			List<ChessField> solutionFields = new ArrayList<>();
			List<ChessField> partFields = new ArrayList<>();
			
			for(ChessField possibleField : possibleMoves) {
				partFields = possibleField.move(memory, moveCount + 1);
				
				if(!partFields.isEmpty()) {
					if(solutionFields.isEmpty()	|| solutionFields.size() > partFields.size()) 
						solutionFields = partFields;
				}
			}
			
			if(!solutionFields.isEmpty()) {
				solutionFields.add(this);
			}
			
			return solutionFields;
		}
		
		return new ArrayList<>();		
	}

	private boolean isTargetNode(String target) {
		return target.equals(name);
	}
	
	private List<ChessField> calculatePossibleMoves(ChessBoardMap memory) {
		ChessField f1 = new ChessField(x-1, y+2);
		ChessField f2 = new ChessField(x-2, y+1);
		ChessField f3 = new ChessField(x-2, y-1);
		ChessField f4 = new ChessField(x-1, y-2);
		ChessField f5 = new ChessField(x+1, y+2);
		ChessField f6 = new ChessField(x+2, y+1);
		ChessField f7 = new ChessField(x+2, y-1);
		ChessField f8 = new ChessField(x+1, y-2);
	
		List<ChessField> possibleMovements = new ArrayList<>();
		if(isSelectableChessField(memory, f1)!= null) { possibleMovements.add(f1); }
		if(isSelectableChessField(memory, f2)!= null) { possibleMovements.add(f2); }
		if(isSelectableChessField(memory, f3)!= null) { possibleMovements.add(f3); }
		if(isSelectableChessField(memory, f4)!= null) { possibleMovements.add(f4); }
		if(isSelectableChessField(memory, f5)!= null) { possibleMovements.add(f5); }
		if(isSelectableChessField(memory, f6)!= null) { possibleMovements.add(f6); }
		if(isSelectableChessField(memory, f7)!= null) { possibleMovements.add(f7); }
		if(isSelectableChessField(memory, f8)!= null) { possibleMovements.add(f8); }		

		return possibleMovements;
	}

	private ChessField isSelectableChessField(ChessBoardMap memory, ChessField field) {
		int x = field.x; int y = field.y;
		
		if(x < 1 || x > 8 || y < 1 || y > 8) {
			return null;
		}
		
		ChessField fieldExisting = memory.getChessFieldState(field);
		if(fieldExisting != null) {			
			if(fieldExisting.movesNeeded < movesNeeded && fieldExisting.movesNeeded > -1) return null;
			else return (field = fieldExisting);
		}
		
		return field;
	}
	
	public String getName() {
		return name;
	}
	
	public int getX() {
		return x;
	}

	public int getY() {
		return y;
	}

	public String toString() {
		return "| " + name + " | ";
	}
}
