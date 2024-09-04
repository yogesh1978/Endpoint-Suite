package org.example;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.time.LocalDateTime;
import java.util.List;
@JsonIgnoreProperties(ignoreUnknown=true)
public class Epics {
    private String id;
    private String name;
    private String url;
    private LocalDateTime createdOn;
    private LocalDateTime updatedOn;
    private String status;
    private String description;
    private List<Story> userStories;
    private List<Task> tasks;
    private String assigneeEmail;
    private String assigneeName;
    private String accountId;
}
