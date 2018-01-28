package models;

import java.io.Serializable;

public class StoryModel implements Serializable {
    private int storyId = 0;
    private String story;

    public int getStoryId() {
        return storyId;
    }

    public void setStoryId(int storyId) {
        this.storyId = storyId;
    }

    public String getStory() {
        return story;
    }

    public void setStory(String story) {
        this.story = story;
    }
}