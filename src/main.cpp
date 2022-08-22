/* #define GLAD_GL_IMPLEMENTATION */
#include <glad/glad.h>
#define GLFW_INCLUDE_NONE
#include <GLFW/glfw3.h>
#include <iostream>
#include <math.h>

// Vertex Shader source code
const char* vertexShaderSource = "#version 330 core\n"
"layout (location = 0) in vec3 aPos;\n"
"void main()\n"
"{\n"
"   gl_Position = vec4(aPos.x, aPos.y, aPos.z, 1.0);\n"
"}\0";
//Fragment Shader source code
const char* fragmentShaderSource = "#version 330 core\n"
"out vec4 FragColor;\n"
"void main()\n"
"{\n"
"   FragColor = vec4(0.8f, 0.3f, 0.02f, 1.0f);\n"
"}\n\0";



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

  //create the vertex shader
  GLuint vertexShader = glCreateShader(GL_VERTEX_SHADER);
  glShaderSource(vertexShader, 1, &vertexShaderSource, NULL);
  glCompileShader(vertexShader);

  //create the fragment shader
  GLuint fragmentShader = glCreateShader(GL_FRAGMENT_SHADER);
  glShaderSource(fragmentShader, 1, &fragmentShaderSource, NULL);
  glCompileShader(fragmentShader);

  //create the shader program
  GLuint shaderProgram = glCreateProgram();
  glAttachShader(shaderProgram, vertexShader);
  glAttachShader(shaderProgram, fragmentShader);

  glLinkProgram(shaderProgram);

  //no need to keep the shader around since it's already in the GPU
  glDeleteShader(vertexShader);
  glDeleteShader(fragmentShader);

	// Vertices coordinates
	/* GLfloat vertices[] = */
	/* { */
	/* 	-0.5f, -0.5f * float(sqrt(3)) / 3, 0.0f, // Lower left corner */
	/* 	0.5f, -0.5f * float(sqrt(3)) / 3, 0.0f, // Lower right corner */
	/* 	0.0f, 0.5f * float(sqrt(3)) * 2 / 3, 0.0f // Upper corner */
	/* }; */

  /* GLuint VAO, VBO; */

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
