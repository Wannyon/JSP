package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDBBean {

	private static MemberDBBean instance = new MemberDBBean();

	private MemberDBBean() {

	}

	public static MemberDBBean getInstance() {
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/MysqlDB");

		return ds.getConnection();
	}

	public int insertMember(MemberDataBean memberdata) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("INSERT INTO member VALUES (?,?,?,?,?,?)");
			pstmt.setString(1, memberdata.getId());
			pstmt.setString(2, memberdata.getPassword());
			pstmt.setString(3, memberdata.getName());
			pstmt.setInt(4, memberdata.getAge());
			pstmt.setString(5, memberdata.getGender());
			pstmt.setString(6, memberdata.getEmail());
			result = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("가입 오류" + ex.getMessage());
			ex.printStackTrace();

		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {

				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {

				}
		}

		return result;
	}

	public int userCheck(String id, String password) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("SELECT * FROM member WHERE id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) { // 아이디가 존재 일치
				if (password.equals(rs.getString("password"))) { // 패스워드 일치
					result = 1;
				} else
					result = 0;
			} else {
				result = -1;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {

				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {

				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {

				}
		}

		return result; // -1: 아이디가 틀린 경우, 0: 패스워드가 틀린 경우, 1: 올바른 정보
	}

	public ArrayList<MemberDataBean> getMemberlist() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		MemberDataBean memberdata = null;
		ArrayList<MemberDataBean> member_list = new ArrayList<MemberDataBean>();
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("SELECT * FROM member");
			rs = pstmt.executeQuery();
			

				member_list = new ArrayList<MemberDataBean>();
				while(rs.next()) {
					memberdata = new MemberDataBean();
					memberdata.setId(rs.getString("id"));
					memberdata.setPassword(rs.getString("password"));
					memberdata.setName(rs.getString("name"));
					memberdata.setAge(rs.getInt("age"));
					memberdata.setGender(rs.getString("gender"));
					memberdata.setEmail(rs.getString("email"));
					
					member_list.add(memberdata);
				} 		
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {

				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {

				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {

				}
		}
		
		return member_list;
	}
	
	public MemberDataBean selectMember(String id) throws Exception {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberDataBean memberdata = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			
			memberdata = new MemberDataBean();
			memberdata.setId(rs.getString("id"));
			memberdata.setPassword(rs.getString("password"));
			memberdata.setName(rs.getString("name"));
			memberdata.setAge(rs.getInt("age"));
			memberdata.setGender(rs.getString("gender"));
			memberdata.setEmail(rs.getString("email"));
		}catch(Exception ex){
			ex.printStackTrace();
		}
		finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {

				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {

				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {

				}
		}
		
		return memberdata;
	}
	
	public int deleteMember (String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			conn =getConnection();
			
			pstmt = conn.prepareStatement("delete from member where id = ?");
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();	// 성공 1, 실패 0
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {

				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {

				}
		}
		
		return result;
	}
	
	public int updateMember(MemberDataBean memberdata) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			conn =getConnection();
			
			String sql = "UPDATE member SET password = ?, name = ?,age = ?,gender = ?,email = ? WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberdata.getPassword());
			pstmt.setString(2, memberdata.getName());
			pstmt.setInt(3, memberdata.getAge());
			pstmt.setString(4, memberdata.getGender());
			pstmt.setString(5, memberdata.getEmail());
			pstmt.setString(6, memberdata.getId());
			result = pstmt.executeUpdate();	// 성공 1, 실패 0
		}
		catch(Exception ex) {
			System.out.println("수정 오류" + ex.getMessage());
			ex.printStackTrace();
		}
		finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {

				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {

				}
		}
		
		return result;
	}
}
