import { Application } from "@hotwired/stimulus";
import { registerControllers } from "stimulus-vite-helpers";

const application = Application.start();
const controllers = import.meta.glob("./**/*_controller.js", { eager: true });

registerControllers(application, controllers);

import ChatRefreshController from "./chat_refresh_controller"
application.register("chat_refresh", ChatRefreshController)
