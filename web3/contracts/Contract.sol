// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract CrowdFunding {
    struct Campaign {
        address owner;
        string title;
        string description;
        uint256 target;
        uint256 deadline;
        uint256 amountCollected;
        string image;
        address[] donators;
        uint256[ ] donations;
    }
    mapping(uint256 => Campaign) public campaigns;
    
    uint256 public numeberOfCampaigns = 0;
    
    function createCampaign(address _owner, string memory _title, string memory _description,  uint256 _target, uint256 _deadline, string memory _image) public returns(uint256) {
        Campaign storage newCampaign = campaigns[numeberOfCampaigns];
        require(newCampaign.deadline < block.timestamp, "Deadline must be in the future");
        newCampaign.owner = _owner;
        newCampaign.title = _title;
        newCampaign.description = _description;
        newCampaign.target = _target;
        newCampaign.deadline = _deadline;
        newCampaign.image = _image;
        newCampaign.amountCollected = 0;
        numeberOfCampaigns++;
        
        return numeberOfCampaigns-1;
    }
    
    function donateToCampaign(uint256 _id) public payable {
        uint256 amount  = msg.value;
        
        Campaign storage selectedCampaign = campaigns[_id];
        
        selectedCampaign.donators.push(msg.sender);
        selectedCampaign.donations.push(amount);
        
        (bool sent,) = payable(selectedCampaign.owner).call{value: amount}("");
        
        if (sent) {
            selectedCampaign.amountCollected += amount;
        }
    }
    
    
    function getDonators(uint256 _id) view public returns(address[] memory, uint256[] memory) {
        return (campaigns[_id].donators, campaigns[_id].donations);
    }
    
    function getCampaigns() view public returns( Campaign[] memory) {
        Campaign[] memory allCampaigns = new Campaign[](numeberOfCampaigns);
        
        for (uint256 i = 0; i < numeberOfCampaigns; i++) {
            allCampaigns[i] = campaigns[i];
        }
        return allCampaigns;
     }
     
}
