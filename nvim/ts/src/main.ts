class RequestQueue {
    private queue: Array<() => Promise<any>> = [];
    private concurrency: number;
    private activeRequests: number = 0;

    constructor(concurrency: number) {
        this.concurrency = concurrency;
    }
    enqueue(task:() => Promise<any>) {
        this.queue.push(task);
        this.process();
    }
    private async process() {
        if (this.activeRequests >= this.concurrency) return;
        if (this.queue.length > 0) {
            const task = this.queue.shift();
            if (task) {
                this.activeRequests++;
                try {
                    await task();
                } catch (err){
                    console.error("Task failed:", err);
                } finally {
                    this.activeRequests--;
                    this.process();
                }
            }
        }
    }
}

const queue = new RequestQueue(5);

function asyncRQ(id: number): Promise<void> {
    return new Promise((resolve) => {
        setTimeout(() => {
            console.log(`Request ${id} completed`);
            resolve();
        }, 1000 * id);
    });
}
for (let i: number = 1; i <= 5; i++) {
    queue.enqueue(() => asyncRQ(i));
}
