package lee.hg.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import lee.hg.db.DBconn;
import lee.hg.model.ApplyVO;

public class ApplyControl {
	private final String _BLANK = " ";
	final static Logger logger = Logger.getLogger(ApplyControl.class.getSimpleName());
	
	public List<ApplyVO> getTodayApplyList(ApplyVO param){
		List<ApplyVO> result = new ArrayList<ApplyVO>();
		DBconn db = new DBconn();
		try(Connection conn = db.getConnection()){
			StringBuilder sql = new StringBuilder()
					.append("SELECT * FROM Apply").append(_BLANK)
					.append("WHERE idate = ?").append(_BLANK);
			if(param.getTime() > 0) {
				sql.append("AND itime = ?");
			}
			
			PreparedStatement pstmt = conn.prepareCall(sql.toString());
			int i = 1;
			pstmt.setString(i++, param.getDate());
			if(param.getTime() > 0) {
				pstmt.setInt(i++, param.getTime());
			}
			
			logger.info(pstmt.toString());
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				ApplyVO item = new ApplyVO();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setGrade(rs.getString("grade"));
				item.setPhone(rs.getString("phone"));
				item.setDate(rs.getString("idate"));
				item.setTime(rs.getInt("itime"));
				
				result.add(item);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public Map<Integer, ApplyVO> listToTimeMap(List<ApplyVO> input){
		logger.info("list size: " + input.size());
		
		return input.stream().collect(Collectors.toMap(ApplyVO::getTime, applyVO -> applyVO));
	}
	public int insertApply(ApplyVO param) {
		int result = 0;
		DBconn db = new DBconn();
		try(Connection conn = db.getConnection()){
			String sql = new StringBuilder()
					.append("INSERT INTO Apply ")
					.append("(name, phone, grade, subject, idate, itime)")
					.append("VALUES ")
					.append("(?,?,?,?,?,?)")
					.toString();
			
			PreparedStatement pstmt = conn.prepareCall(sql.toString());
			int i = 1;
			pstmt.setString(i++, param.getName());
			pstmt.setString(i++, param.getPhone());
			pstmt.setString(i++, param.getGrade());
			pstmt.setInt(i++, param.getSubject());
			pstmt.setString(i++, param.getDate());
			pstmt.setInt(i++, param.getTime());
			logger.info(pstmt.toString());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
