import { generateTsModels } from "openapi-ts-generator";

generateTsModels({
  openApiJsonUrl: "http://localhost:5161/swagger/v1/swagger.json",
  outputPath: "./src/models/",
  genAngularFormGroups: true /* Set this to true if only if you're in an Angular project*/,
});
