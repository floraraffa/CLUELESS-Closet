"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.CachedEvent = void 0;
class CachedEvent {
    constructor() {
        this.listeners = [];
        this.onceListeners = [];
        this.enabled = true;
        this.hasTriggered = false;
        this.triggeredData = null;
    }
    /**
     * Adds a listener function to the list of listeners for this event.
     * @param listener The listener function that processes the event.
     */
    add(listener) {
        this.listeners.push(listener);
        if (this.hasTriggered) {
            listener(this.triggeredData);
        }
    }
    /**
     * Adds a listener function that will be removed after its first invocation.
     * @param listener The listener function to invoke only once.
     */
    addOnce(listener) {
        if (this.hasTriggered) {
            listener(this.triggeredData);
        }
        else {
            this.onceListeners.push(listener);
        }
    }
    /**
     * Removes a specific listener from the list of listeners for this event.
     * @param listener The listener function to remove.
     */
    remove(listener) {
        const index = this.listeners.indexOf(listener);
        if (index > -1) {
            this.listeners.splice(index, 1);
        }
        else {
            const onceIndex = this.onceListeners.indexOf(listener);
            if (onceIndex > -1) {
                this.onceListeners.splice(onceIndex, 1);
            }
        }
    }
    /**
     * Removes all listeners and once listeners for this event.
     */
    clear() {
        this.listeners = [];
        this.onceListeners = [];
        this.hasTriggered = false;
        this.triggeredData = null;
    }
    /**
     * Triggers the event, calling all registered listeners in the order they were added.
     * Errors in listeners do not prevent subsequent listeners from being called.
     * @param data The data to pass to each listener function.
     */
    trigger(data) {
        if (!this.enabled)
            return;
        this.hasTriggered = true;
        this.triggeredData = data;
        [...this.listeners].forEach(listener => {
            try {
                listener(data);
            }
            catch (error) {
                print("Event listener error:" + error);
            }
        });
        this.onceListeners.forEach(listener => {
            try {
                listener(data);
            }
            catch (error) {
                print("Event listener error:" + error);
            }
        });
        this.onceListeners = []; // Clear once listeners after being called
    }
    /**
     * Disables triggering of the event.
     */
    disable() {
        this.enabled = false;
    }
    /**
     * Enables triggering of the event.
     */
    enable() {
        this.enabled = true;
    }
    /**
     * Returns the number of attached listeners.
     */
    listenerCount() {
        return this.listeners.length + this.onceListeners.length;
    }
}
exports.CachedEvent = CachedEvent;
//# sourceMappingURL=CachedEvent.js.map