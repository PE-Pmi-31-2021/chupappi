using System;
using MongoDB.Bson;

namespace cryptoeye
{
    public class SeenHistoryGenerator
    {
        private static string[] userIds =
        {
            "618c651305e268a873da6dd1", "618c651305e268a873da6ed9", "618c651405e268a873da6f7c",
            "618c651405e268a873da72c5", "618c651405e268a873da7361", "618c651505e268a873da73cf",
            "618c651505e268a873da7466", "618c651505e268a873da750a", "618c651605e268a873da75b0",
            "618c651605e268a873da7654", "618c651705e268a873da76ec", "618c651705e268a873da7772",
            "618c651705e268a873da7812", "618c651805e268a873da78a0", "618c651805e268a873da7923",
            "618c651805e268a873da79e8", "618c651905e268a873da7a5c", "618c651905e268a873da7b17",
            "618c651905e268a873da7bab", "618c651a05e268a873da7c1d", "618c651a05e268a873da7ccb",
            "618c651b05e268a873da7d69", "618c651b05e268a873da7e06", "618c651b05e268a873da7e92",
            "618c651c05e268a873da7f3a", "618c651c05e268a873da7fc9", "618c651c05e268a873da8064",
            "618c651d05e268a873da80f3", "618c651d05e268a873da819f", "618c651d05e268a873da828a",
            "618c651e05e268a873da8318", "618c651e05e268a873da83b7", "618c651e05e268a873da8478",
            "618c651f05e268a873da8501", "618c651f05e268a873da85a9", "618c652005e268a873da863c",
            "618c652005e268a873da8701", "618c652005e268a873da878d", "618c652105e268a873da8879",
            "618c652105e268a873da890a", "618c652105e268a873da89c0", "618c652205e268a873da8a47",
            "618c652205e268a873da8ae3", "618c652205e268a873da8b94", "618c652305e268a873da8c17",
            "618c652305e268a873da8cb9", "618c652405e268a873da8d78", "618c652405e268a873da8e06",
            "618c652405e268a873da8e95", "618c652505e268a873da8f39"
        };
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

        private static string homeRoute = "home/";
        private static string[] names = {"Home", "Crypto", "Profile"};

        public static SeenHistory Generate()
        {
            var rnd = new Random();
            var userId = userIds[rnd.Next(userIds.Length)];
            var name = names[rnd.Next(3)];
            var location = homeRoute;

            if (name == "Crypto")
            {
                var cryptoName = CryptoNames[rnd.Next(CryptoNames.Length)];
                location += $"crypto/{cryptoName}";
            }
            else if (name == "Profile")
            {
                location += $"user/{userIds}";
            }

            return new SeenHistory {UserId = new ObjectId(userId), Location = location, Name = name};
        }
        
    }
}