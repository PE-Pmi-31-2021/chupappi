using System;

namespace cryptoeye
{
    public class CryptoGenerator
    {
        private static readonly string[] CryptoNames =
        {
            "42 Coin",
            "300 token",
            "365Coin",
            "404Coin",
            "433 Token",
            "SixEleven",
            "808",
            "Octocoin",
            "EliteCoin",
            "2015 coin",
            "Arcade City",
            "ClubCoin",
            "007 coin",
            "0chain",
            "0x",
            "0xBitcoin",
            "16BitCoin",
            "1717 Masonic Commemorative Token",
            "1Credit",
            "1World",
            "23 Skidoo",
            "2Acoin",
            "2BACCO Coin",
            "2GiveCoin",
            "2TF",
            "32Bitcoin",
            "3DChain",
            "3DES",
            "8 Circuit Studios",
            "8BIT Coin",
            "A-Token",
            "AAA Reserve Currency",
            "AB-CHAIN",
            "AB-Chain",
            "ABCC Token",
            "AC3",
            "ACA Token",
            "ACT",
            "ACoin",
            "AEN",
            "AEON",
            "AERGO",
            "AGATE",
            "AI Crypto",
            "AI Doctor",
            "AIChain Token",
            "AICoin",
            "AIOT Token",
            "AITrading",
            "AIX",
            "ALAX",
            "ALISmedia",
            "ALTcoin",
            "AMBT Token",
            "AMIS",
            "AMLT",
            "AMO Coin",
            "ANON",
            "ANTS Reloaded",
            "APIS",
            "APRES",
            "AQwire",
            "ARBITRAGE",
            "ARENON",
            "ARK",
            "ARNA Panacea",
            "ARROUND",
            "ASG",
            "ASQ Protocol",
            "ATB coin",
            "ATC Coin",
            "ATFS Project",
            "ATLANT",
            "ATMChain",
            "AU-Coin",
            "AWAX",
            "AXRON",
            "AXS",
            "Abele",
            "Abjcoin",
            "Absolute Coin",
            "Accelerator Network",
            "Accolade",
            "AcesCoin",
            "AcesCoin",
            "Achain",
            "AchieveCoin",
            "AcidCoin",
            "Acorn Collective",
            "Actinium",
            "Action Coin",
            "Acumen",
            "Acute Angle Cloud",
            "AdCoin",
            "AdEx",
            "AdToken",
            "Adab Solutions",
            "Adamant",
            "Adbank",
            "Adelphoi"
        };

        public static Crypto Generate()
        {
            var rnd = new Random();
            
            var name = CryptoNames[rnd.Next(CryptoNames.Length)];
            var apiId = name;
            
            return new Crypto
            {
                Name = name, ApiId = apiId
            };
        }
    }
}