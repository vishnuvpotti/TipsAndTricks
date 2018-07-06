function Test-DBConnection
{    
    [OutputType([bool])]
    Param
    (
        [Parameter(Mandatory=$true,
                    ValueFromPipelineByPropertyName=$true,
                    Position=0)]
        $ConnectionString
    )
    try
    {
        $dbConn = New-Object System.Data.SqlClient.SqlConnection $ConnectionString;
        $dbConn.Open();
        $dbConn.Close();

        return $true;
    }
    catch
    {
        return $false;
    }
}


Test-DBConnection "Data Source=IP;database=dbname;User ID=userid;Password=password;"
