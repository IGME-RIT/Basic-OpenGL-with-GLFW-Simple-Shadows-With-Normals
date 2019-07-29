Documentation & Tutorial Author: Sanketh Bhat, 2019

Reference:https://learnopengl.com/Advanced-Lighting/Normal-Mapping

This tutorial was designed for Visual Studio 2017 / 2019
If the solution does not compile, retarget the solution
to a different version of the Windows SDK. If you do not
have any version of the Windows SDK, it can be installed
from the Visual Studio Installer Tool

Simple Dynamic Shadows with Normal Mapping Tutorial

Reference: https://learnopengl.com/Advanced-Lighting/Shadows/Shadow-Mapping

Prerequesites: Simple Dynamic Shadows

Note: This is directional shadows ONLY, no point or spotlight shadows

New Concepts: Depth buffer

The different steps with Simple Dynamic Shadows are listed below:
>We attach a normal map texture onto our shadow pass material.
>We enable a tangent attribute for our second pass
>In the shadow vertex shader we calculate a new Tangent-bitangent-normal(TBN matrix)
>In the shadow frag shader we calculate diffuse value using dot(light direction, normal)
>For the second pass we manually set the texture location to 4 






