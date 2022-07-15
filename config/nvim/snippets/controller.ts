import { Controller, Get, Post } from '@nestjs/common';

@Controller('example')
export class ExampleController {
    @Post()
    create(): string {
        return 'Message for create';
    }

    @Get()
    findAll(): string {
        return 'Message for return data';
    }
}
