

#version 430 core

layout(location = 0) in vec3 position;
layout(location = 1) in vec2 in_uv;
layout(location = 2) in vec3 in_normal;
layout(location = 3) in vec3 in_tangent;

uniform mat4 cameraMatrix;
uniform mat4 worldMatrix;
uniform mat4 lightSpaceMatrix;

out vec3 fragPosition;
out vec2 uv;
out vec3 normal;
out vec4 fragLSPosition;
out mat3 TBN;

void main()
{ 
    //vertex position in world space
    fragPosition= vec3(worldMatrix*vec4(position,1.0));
    
    uv=in_uv;

    //Vertex position from light perspective
    fragLSPosition = lightSpaceMatrix * vec4(fragPosition, 1.0);

    //Vertex position in camera space (pixel position)
    gl_Position = cameraMatrix * worldMatrix * vec4(position, 1.0);
   
    //TBN calculation
    mat3 normalMat = transpose(inverse(mat3(worldMatrix)));
    normal = normalize(normalMat * in_normal);

    vec3 tangent = normalize(normalMat * in_tangent);
    tangent = normalize(tangent - dot(tangent, normal) * normal);
    vec3 bitangent = cross(normal, tangent);

    TBN = transpose(mat3(tangent, bitangent, normal));
}  