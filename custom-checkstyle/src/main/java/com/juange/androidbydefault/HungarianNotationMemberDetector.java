package com.juange.androidbydefault;

import java.util.regex.Pattern;

/**
 * Created by juange on 10/4/15.
 */
public class HungarianNotationMemberDetector {
    private Pattern pattern = Pattern.compile("m[A-Z0-9].*");

    public boolean detectsNotation(String variableName) {
        return pattern.matcher(variableName).matches();
    }
}
