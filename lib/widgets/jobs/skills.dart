import "package:flutter/material.dart";

List<Container> jobSkills(List<String> skills) {
  return skills.map((skill) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        skill,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }).toList();
}
