package com.amadedev.sampleapi

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.format.annotation.DateTimeFormat
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.*
import java.util.*

@SpringBootApplication
class SampleApiApplication

fun main(args: Array<String>) {
    runApplication<SampleApiApplication>(*args)
}

data class Message(
    val message: String,
    @field:DateTimeFormat val date: Date = Date(),
)

@RestController
@RequestMapping
class MessageController {
    private val messages: MutableList<Message> = mutableListOf()

    init {
        println("INIT-MESSAGE-CONTROLLER")
    }

    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/all")
    suspend fun findAll(): List<Message> {
        println("FIND-ALL")
        return messages
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/send")
    suspend fun send(@RequestBody message: Message): String {
        println("SEND")
        messages.add(message)
        return "Send"
    }

}