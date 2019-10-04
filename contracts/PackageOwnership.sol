pragma solidity ^0.5.11;

contract PackageOwnership {
    constructor() public {

    }

    struct Package {
        uint id;
        address packageOwner;
        uint ownershipAssignedAt;
        address[] packageOwnerArr;
        uint[] ownershipAssignedAtArr;
        bool exists;
    }

    mapping (uint => Package) internal packages;

    function initiatePackage(uint _packageId) public {
        address[] memory packageOwnerArr;
        uint[] memory ownershipAssignedAtArr;
        
        packages[_packageId] = Package(_packageId, msg.sender, now, packageOwnerArr, ownershipAssignedAtArr, true);
        packages[_packageId].packageOwnerArr.push(msg.sender);
        packages[_packageId].ownershipAssignedAtArr.push(now);
        
        emit PackageInitiated(_packageId, msg.sender);
    }

    function transferPackageOwnership(uint _packageId, address _newOwner) public
        isPackageOwner(_packageId)
        differentOwner(_newOwner)
    {
        packages[_packageId].packageOwner = _newOwner;
        packages[_packageId].ownershipAssignedAt = now;
        
        packages[_packageId].packageOwnerArr.push(_newOwner);
        packages[_packageId].ownershipAssignedAtArr.push(now);
        
        emit PackageOwnershipTransferred(msg.sender, _newOwner);
    }
    
    function getPackageOwnershipHistory(uint _packageId) public view returns(uint[] memory, address[] memory) {
        Package memory p = packages[_packageId];
        
        return (p.ownershipAssignedAtArr, p.packageOwnerArr);
    }
    
    function currentOwner(uint _packageId) public view returns(address) {
        return packages[_packageId].packageOwner;
    }

    event PackageOwnershipTransferred(address indexed _oldOwner, address indexed _newOwner);
    event PackageInitiated(uint indexed _packageId, address _owner);

    modifier isPackageOwner(uint _packageId) {
        require(packages[_packageId].packageOwner == msg.sender, "Only the owner of this package can invoke.");
        _;
    }
    
    modifier differentOwner(address _newOwner) {
        require(msg.sender != _newOwner, "New owner's address must be different from current owner's.");
        _;
    }
}