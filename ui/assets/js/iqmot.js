const iqmotAbi = [
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_name",
				"type": "string"
			},
			{
				"internalType": "address",
				"name": "_address",
				"type": "address"
			}
		],
		"name": "addAddress",
		"outputs": [
			{
				"internalType": "bool",
				"name": "_added",
				"type": "bool"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getAddressBook",
		"outputs": [
			{
				"internalType": "string[]",
				"name": "_names",
				"type": "string[]"
			},
			{
				"internalType": "address[]",
				"name": "_addresses",
				"type": "address[]"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_recipient",
				"type": "address"
			}
		],
		"name": "getMessages",
		"outputs": [
			{
				"internalType": "string[]",
				"name": "_cidList",
				"type": "string[]"
			},
			{
				"internalType": "uint256[]",
				"name": "_sentTimes",
				"type": "uint256[]"
			},
			{
				"internalType": "address[]",
				"name": "senders",
				"type": "address[]"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_recipient",
				"type": "address"
			},
			{
				"internalType": "string",
				"name": "cid",
				"type": "string"
			}
		],
		"name": "sendMessage",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "_sentTime",
				"type": "uint256"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	}
]