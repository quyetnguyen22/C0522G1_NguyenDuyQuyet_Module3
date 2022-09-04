package model;

public class CustomerRank {
    private int rankId;
    private String rankName;

    public CustomerRank() {
    }

    public CustomerRank(int rankId, String rankName) {
        this.rankId = rankId;
        this.rankName = rankName;
    }

    public int getRankId() {
        return rankId;
    }

    public void setRankId(int rankId) {
        this.rankId = rankId;
    }

    public String getRankName() {
        return rankName;
    }

    public void setRankName(String rankName) {
        this.rankName = rankName;
    }
}
