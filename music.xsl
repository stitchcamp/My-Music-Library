<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
    <title>My Music Library</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
        }
        
        header {
            background: linear-gradient(to right, #8e44ad, #3498db);
            color: white;
            text-align: center;
            padding: 2rem 0;
            margin-bottom: 2rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        h1 {
            margin: 0;
            font-size: 2.5rem;
        }
        
        .subtitle {
            font-size: 1.2rem;
            margin-top: 0.5rem;
            opacity: 0.9;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
        }
        
        h2 {
            margin-top: 2rem;
            margin-bottom: 1.5rem;
            color: #2c3e50;
            border-bottom: 2px solid #8e44ad;
            padding-bottom: 0.5rem;
            display: inline-block;
        }
        
        .song-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .song-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .song-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
        }
        
        .song-header {
            background: linear-gradient(to right, #8e2de2, #4a00e0);
            color: white;
            padding: 1.2rem;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .song-icon {
            background-color: #f1c40f;
            color: #8e2de2;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            font-weight: bold;
        }
        
        .song-content {
            padding: 1.5rem;
        }
        
        .song-title {
            font-size: 1.4rem;
            margin-bottom: 0.8rem;
            color: #2c3e50;
            font-weight: bold;
        }
        
        .artist {
            font-weight: bold;
            color: #8e44ad;
            margin-bottom: 1rem;
            font-size: 1.1rem;
        }
        
        .year {
            font-style: italic;
            color: #7f8c8d;
            margin-bottom: 1rem;
            padding-bottom: 0.8rem;
            border-bottom: 1px dashed #eee;
        }
        
        .albums-title {
            font-weight: bold;
            margin-bottom: 0.5rem;
            color: #2c3e50;
        }
        
        .album-list {
            margin: 0;
            padding-left: 1.5rem;
            list-style-type: none; /* Removes the bullet points/icons */
        }
        
        .album-list li {
            margin-bottom: 0.5rem;
            line-height: 1.4;
        }
        
        .album-list li:last-child {
            margin-bottom: 0;
        }
        
        .xpath-queries {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            margin-bottom: 3rem;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
        }
        
        .query {
            margin-bottom: 2rem;
        }
        
        .query:last-child {
            margin-bottom: 0;
        }
        
        .query-title {
            color: #8e44ad;
            margin-bottom: 0.8rem;
            font-weight: bold;
            font-size: 1.1rem;
        }
        
        .query-code {
            background: #f0f0f0;
            padding: 0.5rem 0.8rem;
            border-radius: 4px;
            font-family: monospace;
            margin-bottom: 0.8rem;
            font-size: 0.9rem;
        }
        
        .query-result {
            background: #f8f9fa;
            padding: 1rem;
            border-radius: 8px;
            border-left: 4px solid #3498db;
        }
        
        .query-result ul {
            margin: 0;
            padding-left: 1.5rem;
        }
        
        .query-result li {
            margin-bottom: 0.25rem;
        }
        
        footer {
            background: #2c3e50;
            color: white;
            text-align: center;
            padding: 1.5rem 0;
            margin-top: 3rem;
        }
        
        @media (max-width: 768px) {
            .song-grid {
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            }
            
            .song-header {
                padding: 1rem;
            }
            
            .song-content {
                padding: 1.2rem;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>My Music Library</h1>
        <p class="subtitle">Web Systems and Technologies Activity</p>
    </header>
    
    <div class="container">
        <!-- All Songs Section -->
        <h2>All Songs</h2>
        <div class="song-grid">
            <xsl:for-each select="music/song">
                <div class="song-card">
                    <div class="song-header">
                        <span><xsl:value-of select="songTitle"/></span>
                        <div class="song-icon">♪</div>
                    </div>
                    <div class="song-content">
                        <div class="artist">Artist: <xsl:value-of select="artist"/></div>
                        <div class="year">Year: <xsl:value-of select="debutYear"/></div>
                        <div class="albums-title">Albums:</div>
                        <ul class="album-list">
                            <xsl:for-each select="albums/album">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </div>
            </xsl:for-each>
        </div>
        
        <!-- XPath Queries Section -->
        <h2>XPath Queries</h2>
        <div class="xpath-queries">
            <div class="query">
                <div class="query-title">Query 1: Select all song titles</div>
                <div class="query-code">XPath: music/song/songTitle</div>
                <div class="query-result">
                    <ul>
                        <xsl:for-each select="music/song/songTitle">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>
                </div>
            </div>
            
            <div class="query">
                <div class="query-title">Query 2: Select the artist for the fifth song</div>
                <div class="query-code">XPath: music/song[5]/artist</div>
                <div class="query-result">
                    <xsl:value-of select="music/song[5]/artist"/>
                </div>
            </div>
            
            <div class="query">
                <div class="query-title">Query 3: Select song with id="1"</div>
                <div class="query-code">XPath: music/song[@id='1']</div>
                <div class="query-result">
                    <div><strong>Title:</strong> <xsl:value-of select="music/song[@id='1']/songTitle"/></div>
                    <div><strong>Artist:</strong> <xsl:value-of select="music/song[@id='1']/artist"/></div>
                    <div><strong>Year:</strong> <xsl:value-of select="music/song[@id='1']/debutYear"/></div>
                </div>
            </div>
        </div>
    </div>
    
    <footer>
        Music Library Website - Web Systems and Technologies Project
    </footer>
</body>
</html>
</xsl:template>
</xsl:stylesheet>