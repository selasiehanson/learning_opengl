#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <iostream>

int main() {
  glfwInit();

  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
  //tell open gl u are using core profile.
  //using core profile means we are using modern functions
  glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
  glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE); // needed for mac

  //create a window with a title
  GLFWwindow *window = glfwCreateWindow(800, 800, "Window Window", NULL, NULL);

  //Error check window
  if (window == NULL) {
    std::cout << "Failed to create GLFW window" << std::endl;
    return -1;
  }

  //Introduce the window to the current context
  glfwMakeContextCurrent(window);

  //Load GLAD so it configuures opengl
  gladLoadGL();

  //specify the viewport
  glViewport(0, 0, 800, 800);

  //specify the color of  the background
  glClearColor(0.07f, 0.13f, 0.17f, 1.0f);

  //clear the backbuffer and assign the new color to it.
  glClear(GL_COLOR_BUFFER_BIT);

  //swap the back buffer with the front buffer
  glfwSwapBuffers(window);

  while (!glfwWindowShouldClose(window)) {
    glfwPollEvents();
  }

  glfwDestroyWindow(window);
  glfwTerminate();
  return 0;
}
