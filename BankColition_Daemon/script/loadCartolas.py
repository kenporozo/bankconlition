# Locales
from getFromModel import getCuentasBancarias
from getCartolas import getCartola
from setCartolas import insertCartolas

def initDownloads(data, folderPath):  
    xPath = '//*[@id="signup-form"]/a'
    for bankData in data:    
        filepath = getCartola(bankData['url'], bankData['rut'], bankData['Password'], xPath, folderPath)
        insertCartolas(bankData, filepath)  
         
def getBankData():
    #filename='./Temp/queryCuentasBancarias.json'
    #file=open(filename)
    #dictData = json.load(file)
    dictData = getCuentasBancarias()
    folderPath = 'C:/Users/hbudd/OneDrive/VS_Code/BankColition/Temp'
    
    return dictData, folderPath 

def main():
    dictData, folder = getBankData()
    initDownloads(dictData, folder)

if __name__ == "__main__":
    main()