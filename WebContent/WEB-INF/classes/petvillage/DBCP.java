package petvillage;


import java.sql.*; 
import java.util.*; 
import javax.sql.*; 
import javax.naming.*; 

public class DBCP {

		private Connection con = null;
		private PreparedStatement pstmt = null;
		private DataSource ds = null;

		public DBCP() {
			try {
				InitialContext ctx = new InitialContext();
			    ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
			} catch (Exception e) {
				e.printStackTrace();
			}		
		}
		
		public void connect() {
			try {
			    con = ds.getConnection();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void disconnect() {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} 
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		//main.jsp
		public ArrayList<BoardEntity> getBoardList() {	
			connect();
			ArrayList<BoardEntity> list = new ArrayList<BoardEntity>();
			
			String SQL = "select * from board order by wdate DESC";
			try {
				pstmt = con.prepareStatement(SQL);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					BoardEntity brd = new BoardEntity();
					brd.setBoard_id ( rs.getInt("board_id") );
					brd.setUser_id(rs.getString("user_id"));
					brd.setBoard_type(rs.getString("board_type"));
					brd.setTitle ( rs.getString("title") );
					brd.setImage(rs.getString("image"));
					brd.setVideo(rs.getString("video"));
					brd.setContents(rs.getString("contents"));
					brd.setWdate(rs.getTimestamp("wdate"));
					
					list.add(brd);
				}rs.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			finally {
				disconnect();
			}
			return list;
		}
		//dog,cat,bird,else.jsp
		public ArrayList<BoardEntity> getTypeBoardList(String board_type) {	
			connect();
			ArrayList<BoardEntity> list = new ArrayList<BoardEntity>();
			
			String SQL = "select * from board where board_type=?";
			try {
				pstmt = con.prepareStatement(SQL);
				pstmt.setString(1, board_type);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					BoardEntity brd = new BoardEntity();
					brd.setBoard_id ( rs.getInt("board_id") );
					brd.setUser_id(rs.getString("user_id"));
					brd.setBoard_type(rs.getString("board_type"));
					brd.setTitle ( rs.getString("title") );
					brd.setImage(rs.getString("image"));
					brd.setVideo(rs.getString("video"));
					brd.setContents(rs.getString("contents"));
					brd.setWdate(rs.getTimestamp("wdate"));
					
					list.add(brd);
				}rs.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			finally {
				disconnect();
			}
			return list;
		}
		//edit.jsp
		public boolean insertBoard(BoardEntity board) {
			boolean success = false; 
			connect();
			String sql ="insert into board values(0, ?, ?, ?, ?, ?, ?,sysdate())";		
			try {

				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, board.getUser_id());
				pstmt.setString(2, board.getBoard_type());
				pstmt.setString(3, board.getTitle());
				pstmt.setString(4, board.getImage());
				pstmt.setString(5, board.getVideo());
				pstmt.setString(6, board.getContents());
				pstmt.executeUpdate();
				success = true; 
				
				
			} catch (SQLException e) {
				e.printStackTrace();
				return success;
			}
			finally {
				disconnect();
			}
			return success;
		}
		
		public boolean updateBoard(BoardEntity board) {
			boolean success = false; 
			connect();		
			String sql ="update board set board_type=?, title=?, image=?, video=?, contents=? where board_id=?";	
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, board.getBoard_type());
				pstmt.setString(2, board.getTitle());
				pstmt.setString(3, board.getImage());
				pstmt.setString(4, board.getVideo());
				pstmt.setString(5, board.getContents());
				pstmt.setInt(6, board.getBoard_id());
				int rowUdt = pstmt.executeUpdate();
				//System.out.println(rowUdt);
				if (rowUdt == 1) success = true;
			} catch (SQLException e) {
				e.printStackTrace();
				return success;
			}
			finally {
				disconnect();
			}
			return success;
		}
		
		public boolean deleteBoard(int board_id) {
			boolean success = false; 
			connect();		
			String sql ="delete from board where board_id=?";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, board_id);
				pstmt.executeUpdate();
				success = true;
			} catch (SQLException e) {
				e.printStackTrace();
				return success;
			}
			finally {
				disconnect();
			}
			return success;
		}
		//detail.jsp
		public BoardEntity getBoard(int board_id) {	
			connect();
			String SQL = "select * from board where board_id = ?";
			BoardEntity brd = new BoardEntity();
			
			try {
				pstmt = con.prepareStatement(SQL);
				pstmt.setInt(1, board_id);
				ResultSet rs = pstmt.executeQuery();			
				rs.next();
				brd.setBoard_id( rs.getInt("board_id") );
				brd.setUser_id( rs.getString("user_id") );
				brd.setBoard_type( rs.getString("board_type") );
				brd.setTitle ( rs.getString("title") );
				brd.setImage(rs.getString("image"));
				brd.setVideo(rs.getString("video"));
				brd.setContents(rs.getString("contents"));
				brd.setWdate(rs.getTimestamp("wdate"));
				rs.close();			
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			finally {
				disconnect();
			}
			return brd;
		}
		
		//mypage.jsp
		public ArrayList<BoardEntity> getIdBoardList(String user_id) {	
			connect();
			ArrayList<BoardEntity> list = new ArrayList<BoardEntity>();
			
			String SQL = "select * from board where user_id=?";
			try {
				pstmt = con.prepareStatement(SQL);
				pstmt.setString(1, user_id);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					BoardEntity brd = new BoardEntity();
					brd.setBoard_id ( rs.getInt("board_id") );
					brd.setUser_id(rs.getString("user_id"));
					brd.setBoard_type(rs.getString("board_type"));
					brd.setTitle ( rs.getString("title") );
					brd.setImage(rs.getString("image"));
					brd.setVideo(rs.getString("video"));
					brd.setContents(rs.getString("contents"));
					brd.setWdate(rs.getTimestamp("wdate"));
					
					list.add(brd);
				}rs.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			finally {
				disconnect();
			}
			return list;
		}
		
		public UserEntity getUserData(String user_id) {	
			connect();
			String SQL = "select * from user where id = ?";
			UserEntity usr = new UserEntity();
			
			try {
				pstmt = con.prepareStatement(SQL);
				pstmt.setString(1, user_id);
				ResultSet rs = pstmt.executeQuery();			
				rs.next();
				usr.setId(rs.getString("id"));
				usr.setPasswd(rs.getString("passwd"));
				usr.setPoint(rs.getInt("point"));
				usr.setEmail(rs.getString("email"));
				rs.close();			
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			finally {
				disconnect();
			}
			return usr;
		}
		
		//signin.jsp
		public boolean isPasswd(String id, String passwd) {
			boolean success = false;
			connect();		
			String sql ="select passwd from user where id=?";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				String orgPasswd = rs.getString(1);
				if ( passwd.equals(orgPasswd) ) success = true; 
				System.out.println(success);
				rs.close();			
			} catch (SQLException e) {
				e.printStackTrace();
				return success;
			}
			finally {
				disconnect();
			}
			return success;
		}
		//signup.jsp
		public boolean isIdExist(String id) {
			boolean success = false;
			connect();		
			String sql ="select id from user where exists(select id from user where id=?)";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				String orgId = rs.getString(1);
				if ( id.equals(orgId) ) success = true;//==exist 
				System.out.println(success);
				rs.close();			
			} catch (SQLException e) {
				e.printStackTrace();
				return success;//not exist
			}
			finally {
				disconnect();
			}
			return success;
		}
		
		public boolean insertUser(UserEntity user) {
			boolean success = false; 
			connect();
			String sql ="insert into user values(?, ?, 0, ?)";		
			try {

				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user.getId());
				pstmt.setString(2, user.getPasswd());
				pstmt.setString(3, user.getEmail());
				pstmt.executeUpdate();
				success = true; 
				
			} catch (SQLException e) {
				e.printStackTrace();
				return success;
			}
			finally {
				disconnect();
			}
			return success;
		}
		//insert,update point
		public boolean insertGame(String id) {
			boolean success = false; 
			connect();		
			String sql ="insert into game values (?,0,0) ";	
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,id);
				int rowUdt =pstmt.executeUpdate();
				if (rowUdt==1) success=true;
			}catch(SQLException e) {
				e.printStackTrace();
				return success;
			}finally {
				disconnect();
			}
			return success;
		}
		
		public boolean updatePoint(String id) {
			boolean success = false; 
			connect();		
			String sql ="update user set point=point+5 where id=?";	
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,id);
				int rowUdt =pstmt.executeUpdate();
				if (rowUdt==1) success=true;
			}catch(SQLException e) {
				e.printStackTrace();
				return success;
			}finally {
				disconnect();
			}
			return success;
		}
		
		public ArrayList<GameEntity> getDinoList() {	
			connect();
			ArrayList<GameEntity> list = new ArrayList<GameEntity>();
			
			String SQL = "select * from game order by dino_jump DESC ";
			try {
				pstmt = con.prepareStatement(SQL);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					GameEntity gm = new GameEntity();
					gm.setUser_id(rs.getString("user_id"));
					gm.setBrick_out(rs.getInt("brick_out"));
					gm.setDino_jump(rs.getInt("dino_jump"));
					
					list.add(gm);
				}rs.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			finally {
				disconnect();
			}
			return list;
		}
		
		public ArrayList<GameEntity> getBrickList() {	
			connect();
			ArrayList<GameEntity> list = new ArrayList<GameEntity>();
			
			String SQL = "select * from game order by brick_out DESC ";
			try {
				pstmt = con.prepareStatement(SQL);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					GameEntity gm = new GameEntity();
					gm.setUser_id(rs.getString("user_id"));
					gm.setBrick_out(rs.getInt("brick_out"));
					gm.setDino_jump(rs.getInt("dino_jump"));
					
					list.add(gm);
				}rs.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			finally {
				disconnect();
			}
			return list;
		}
		
		public boolean updateDinoPoint(String id,int point) {
			boolean success = false; 
			connect();		
			String sql ="update game set dino_jump=? where user_id=?";	
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,point);
				pstmt.setString(2,id);
				int rowUdt =pstmt.executeUpdate();
				if (rowUdt==1) success=true;
			}catch(SQLException e) {
				e.printStackTrace();
				return success;
			}finally {
				disconnect();
			}
			return success;
		}
		
		public boolean updateBrickPoint(String id,int point) {
			boolean success = false; 
			connect();		
			String sql ="update game set brick_out=? where user_id=?";	
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,point);
				pstmt.setString(2,id);
				int rowUdt =pstmt.executeUpdate();
				if (rowUdt==1) success=true;
			}catch(SQLException e) {
				e.printStackTrace();
				return success;
			}finally {
				disconnect();
			}
			return success;
		}
	
}

