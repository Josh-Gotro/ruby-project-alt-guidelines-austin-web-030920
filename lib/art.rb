
class Art < ActiveRecord::Base
    
    #Color Options
    # :black, :light_black, :red, :light_red, :green, :light_green, 
    # :yellow, :light_yellow, :blue, :light_blue, :magenta, :light_magenta, 
    # :cyan, :light_cyan, :white, :light_white, :default 
    
#######################################################################

    #Header Text
    def self.h(string)
        # string.blue.on_light_black
        string.colorize(:blue)
    end

    #Primary Text
    def self.p(string)
        string.colorize(:blue)
    end

    #Secondary Text
    def self.s(string)
        string.colorize(:light_cyan)
    end

    #Error Text
    def self.e(string)
        string.colorize(:red)
    end

    #Numbered List
    def self.n(string) 
        # string.blue.on_light_black
        string.colorize(:light_magenta)
    end



    ##blue on light white
    ##blue on light magenta
#######################################################################

    #Shapes
    def self.triangle_drop
        puts self.n("*"*30), self.n("*"*20), self.n("*"*10), self.n("*"*2)
    end

    def self.pink_triangle_drop
        puts self.s("*"*30), self.s("*"*20), self.s("*"*10), self.s("*"*2)
    end


#######################################################################
    
    #ASCII Headers
    def self.welcome
        puts self.h("\n
        ░█──░█ ░█▀▀▀ ░█─── ░█▀▀█ ░█▀▀▀█ ░█▀▄▀█ ░█▀▀▀ 　 ▀▀█▀▀ ░█▀▀▀█ 　 ░█▀▀█ ▀█▀ ░█▀▀▄ ░█▀▀▀ ░█▀▀█ ─█▀▀█ ░█▀▀█ ░█▀▀▀ 
        ░█░█░█ ░█▀▀▀ ░█─── ░█─── ░█──░█ ░█░█░█ ░█▀▀▀ 　 ─░█── ░█──░█ 　 ░█▄▄▀ ░█─ ░█─░█ ░█▀▀▀ ░█─── ░█▄▄█ ░█▄▄▀ ░█▀▀▀ 
        ░█▄▀▄█ ░█▄▄▄ ░█▄▄█ ░█▄▄█ ░█▄▄▄█ ░█──░█ ░█▄▄▄ 　 ─░█── ░█▄▄▄█ 　 ░█─░█ ▄█▄ ░█▄▄▀ ░█▄▄▄ ░█▄▄█ ░█─░█ ░█─░█ ░█▄▄▄ \n")
    end

    def self.success
        puts self.h("\n
        ░█▀▀▀█ ░█─░█ ░█▀▀█ ░█▀▀█ ░█▀▀▀ ░█▀▀▀█ ░█▀▀▀█ █ █ 
        ─▀▀▀▄▄ ░█─░█ ░█─── ░█─── ░█▀▀▀ ─▀▀▀▄▄ ─▀▀▀▄▄ ▀ ▀ 
        ░█▄▄▄█ ─▀▄▄▀ ░█▄▄█ ░█▄▄█ ░█▄▄▄ ░█▄▄▄█ ░█▄▄▄█ ▄ ▄ \n")
    end

    def self.booked
        puts self.h("\n         
            █▄█ █▀█ █░█ █▀█   █░█ █ █▀ █ ▀█▀   █░█ ▄▀█ █▀   █▄▄ █▀▀ █▀▀ █▄░█   █▄▄ █▀█ █▀█ █▄▀ █▀▀ █▀▄ ░
            ░█░ █▄█ █▄█ █▀▄   ▀▄▀ █ ▄█ █ ░█░   █▀█ █▀█ ▄█   █▄█ ██▄ ██▄ █░▀█   █▄█ █▄█ █▄█ █░█ ██▄ █▄▀ ▄ \n")
    end

    def self.visits
        puts self.h("\n
        ░█▀▀█ █▀▀█ █▀▀ ▀█─█▀ ─▀─ █▀▀█ █──█ █▀▀ 　 ░█──░█ ─▀─ █▀▀ ─▀─ ▀▀█▀▀ █▀▀ ▄ 
        ░█▄▄█ █▄▄▀ █▀▀ ─█▄█─ ▀█▀ █──█ █──█ ▀▀█ 　 ─░█░█─ ▀█▀ ▀▀█ ▀█▀ ──█── ▀▀█ ─ 
        ░█─── ▀─▀▀ ▀▀▀ ──▀── ▀▀▀ ▀▀▀▀ ─▀▀▀ ▀▀▀ 　 ──▀▄▀─ ▀▀▀ ▀▀▀ ▀▀▀ ──▀── ▀▀▀ ▀ \n")
    end

    def self.logout
        puts self.h("\n

            ▀▀█▀▀ █──█ █▀▀█ █▀▀▄ █─█ █▀▀ 　 █▀▀ █▀▀█ █▀▀█ 　 █──█ █▀▀ ─▀─ █▀▀▄ █▀▀▀ 
            ─░█── █▀▀█ █▄▄█ █──█ █▀▄ ▀▀█ 　 █▀▀ █──█ █▄▄▀ 　 █──█ ▀▀█ ▀█▀ █──█ █─▀█ 
            ─░█── ▀──▀ ▀──▀ ▀──▀ ▀─▀ ▀▀▀ 　 ▀── ▀▀▀▀ ▀─▀▀ 　 ─▀▀▀ ▀▀▀ ▀▀▀ ▀──▀ ▀▀▀▀ 
            
            ░█▀▀█ ─▀─ █▀▀▄ █▀▀ ░█▀▀█ █▀▀█ █▀▀█ █▀▀ █ 
            ░█▄▄▀ ▀█▀ █──█ █▀▀ ░█─── █▄▄█ █▄▄▀ █▀▀ ▀ 
            ░█─░█ ▀▀▀ ▀▀▀─ ▀▀▀ ░█▄▄█ ▀──▀ ▀─▀▀ ▀▀▀ ▄ \n") + self.h("        ___
            _-_-  _/`______``__
         _-_-__  / ,-. -|-  ,-.`-.
            _-_- `( o )----( o )-'
                   `-'      `-' ")
    end

#     def self.fast_car
#         puts self.h("\n 
#             ___..............._
#             __.. ' _'.""""""||""""""""- .`-._
# ______.-'         (_) |      ||           ` ||`-. _
# /_       --------------'-------||---....______||__`.`  -..___
# | T      _.----._           Xxx|x...           |          _.._`--. _
# | |    .' ..--.. `.         XXX|XXXXXXXXXxx==  |       .'.---..`.     -._
# |_j   /  /  __  |  |        XXX|XXXXXXXXXXX==  |      / /  __  | |        `-.
# _|  |  |  /   |  |  |       XXX|""'            |     / |  /  |  | |          |
# |__|_j  | |___/  |  L__________|_______________|_____j |  |__/  | L__________J
#     `'| |      / ./__________________________________| |      / /___________\
#        `.`----'.'   dp                                `.`----'.'
#          `""""'                                         `""""' \n")
#         end

#     def self.car 
#         puts self.h("\n 
#         ___
#         _-_-  _/`______``__
#      _-_-__  / ,-. -|-  ,-.`-.
#         _-_- `( o )----( o )-'
#                `-'      `-' \n")
#         end





end


