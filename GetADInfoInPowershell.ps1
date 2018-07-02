 #Create a Directory Entry object by passing LDAP server details and credentials.
 $de = New-Object DirectoryServices.DirectoryEntry("LDAP://ldapserver","username", "password")

#perform a directory search to find groups.
$searcher=New-Object System.DirectoryServices.DirectorySearcher($de,"(objectCategory=group)")

$result = $searcher.FindAll()

#Print groups with all attributes.
$result | Select-Object

#Print group info with selected attributes.
$result | Select-Object @{Name="DN";Expression={$_.properties.distinguishedname}},@{Name="gid";Expression={$_.properties.gidnumber }},@{Name="member";Expression={$_.properties.member }},@{Name="groupType";Expression={$_.properties.groupType}},@{Name="memberOf";Expression={$_.properties.memberOf}},@{Name="msSFU30GidNumber";Expression={$_.properties.msSFU30GidNumber}},@{Name="objectGUID";Expression={$_.properties.objectGUID }},@{Name="objectSid";Expression={$_.properties.objectSid}},@{Name="cn";Expression={$_.properties.cn}},@{Name="sAMAccountName";Expression={$_.properties.sAMAccountName}};
