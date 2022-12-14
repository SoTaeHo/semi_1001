package bit.data.service;

import bit.data.dto.CafeDto;
import bit.data.dto.CourseDto;
import bit.data.dto.FoodDto;
import bit.data.dto.TripDto;

import java.util.List;
import java.util.Map;

public interface CourseServiceInter {
	public List<CourseDto> getAllCourses(int user_num);
	public CourseDto getCourse();
	public void insertCourse(CourseDto dto);
	public void deleteCourse(int num);
	public void updateStep(String num, String newStep);
	public List<CourseDto> getSearchList(String searchcolumn,String searchword);
	public List<CafeDto> getSearchCafe(String searchword);
	public List<TripDto> getSearchTrip(String searchword);
	public List<FoodDto> getSearchFood(String searchword);
}
