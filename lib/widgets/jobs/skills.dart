import "package:flutter/material.dart";

List<Container> jobSkills(List<String> skills) {
  return skills.map((skill) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        skill,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }).toList();
}
