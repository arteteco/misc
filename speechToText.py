#!/usr/bin/env python
# -*- coding: utf-8 -*-
#import library
import speech_recognition as sr

# SETTINGS

# File name, the input audio
file_name = "test.wav"

# Language, as in "fr-FR", or "it-IT". Defaults to Italian

lang = "it-IT"

# Output text file. Where should it write the transcribed text

out = "output.txt"

# Initialize recognizer class (for recognizing the speech)
r = sr.Recognizer()

# Reading Audio file as source
# listening the audio file and store in audio_text variable


with sr.AudioFile(file_name) as source:
    
    audio_text = r.listen(source)
    
# recoginize_() method will throw a request error if the API is unreachable, hence using exception handling
    try:
        
        # using google speech recognition
        text = r.recognize_google(audio_text, language = lang)
        print('Converting audio transcripts into text ...')
        f = open(out, "w")
        f.write(text)
        f.close()
     
    except:
         print('Sorry.. run again...')
