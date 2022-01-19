-- В Хаскеле можно создвать свои собственные типы данных

import Prelude hiding (Bool, True, False)

data Bool = True | False        -- используем ключ слово data
                                -- и перечисляем реализацию - True | False

alwaysTrue :: Int -> Boll
alwaysTrue n = True