using System;

namespace cryptoeye
{
    public class TopicsGenerator
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

        private static readonly string[] RandomUrls =
        {
            "https://example.com/anger", "https://ball.example.com/airport/aunt.htm?apparel=activity",
            "http://www.example.org/adjustment.html#breath",
            "http://example.org/baseball.php?bird=bubble&babies=behavior",
            "http://books.example.com/?beginner=bridge&adjustment=arithmetic", "https://example.com/belief.html",
            "https://www.example.edu/bait.htm", "http://www.example.net/",
            "https://www.example.com/?bike=adjustment&aunt=beginner",
            "https://authority.example.com/bee/attraction.php",
            "http://example.com/border/bite?appliance=bomb&aftermath=bait#amount",
            "http://blow.example.com/books.html?achiever=blood&believe=birds", "https://example.com/blade/base",
            "http://www.example.net/books", "http://www.example.com/", "https://www.example.org/",
            "http://www.example.org/?bead=border", "http://www.example.com/bottle/blow.aspx",
            "http://example.net/?branch=advertisement&aftermath=agreement", "https://www.example.com/",
            "https://example.com/ants.aspx", "http://example.net/", "http://blade.example.com/",
            "https://www.example.com/?bells=act", "http://www.example.edu/apparatus",
            "http://www.example.org/amusement/army", "https://www.example.com/?bikes=army",
            "http://www.example.com/boy/birth", "https://www.example.com/", "https://achiever.example.com/birds.html",
            "https://www.example.org/#bottle", "https://www.example.com/beginner/beginner.html",
            "http://www.example.com/", "https://afterthought.example.com/?bee=badge&animal=brother",
            "http://blow.example.com/", "http://www.example.com/", "http://www.example.com/ants",
            "https://www.example.com/#box", "http://example.com/appliance.php", "http://example.com/#advice"
        };
        
        public static Topics Generate()
        {
            var rnd = new Random();
            
            var topicName = CryptoNames[rnd.Next(CryptoNames.Length)];
            var randomUrls = RandomUrls[rnd.Next(RandomUrls.Length)];
            
            return new Topics
            {
                TopicName = topicName, TopicLink = randomUrls
            };

        }
    }
}