package bit.data.dao;

import bit.data.dto.FoodDto;

import java.util.List;
import java.util.Map;

public interface FoodDaoInter {
    public int selectTotalCount(Map<String, String> map);

    public List<FoodDto> selectPagingList(Map<String, Object> map);
    public void insertFood(FoodDto dto);
    public void updateReadCount(int food_num);
    public void deleteFood(int food_num);
    public void updateFood(FoodDto dto);
    public void likesInsert(int food_num);
    public void likesUpdate(int food_num);
}
