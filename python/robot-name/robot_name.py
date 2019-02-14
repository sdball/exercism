import random, string

class Robot(object):
    def __init__(self):
        self.name = NameRegistry().robot_name()
        self.reset = self.__init__

class NameRegistry(object):
    robot_names = set()

    def robot_name(self):
        new_name = self.__random_robot_name()
        if new_name in self.robot_names:
            return self.robot_name()
        self.robot_names.add(new_name)
        return new_name

    def __random_robot_name(self):
        return ''.join([
            self.__random_upper(),
            self.__random_upper(),
            self.__random_digit(),
            self.__random_digit(),
            self.__random_digit(),
        ])

    def __random_upper(self):
        return random.choice(string.ascii_uppercase)

    def __random_digit(self):
        return random.choice(string.digits)
