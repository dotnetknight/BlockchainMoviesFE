// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract Tickets {
    struct TicketStruct {
        address token;
        uint256 dateOfPurchase;
    }

    struct CustomerStruct {
        address token;
        string name;
        TicketStruct[] tickets;
    }

    mapping(address => CustomerStruct) internal customerStructs;
    mapping(address => TicketStruct) internal ticketStructs;

    TicketStruct[] TicketsArray;
    CustomerStruct[] CustomersArray;

    event LogNewTicket(address token, uint256 dateOfPurchase);
    event LogNewCustomer(address token, string name, TicketStruct[] tickets);

    function AddTicket(
        address token,
        uint256 dateOfPurchase,
        string memory name
    ) public {
        if (TicketExists(token)) {
            revert();
        }
        customerStructs[token].token = token;
        customerStructs[token].name = name;
        customerStructs[token].tickets.push(
            TicketStruct(token, dateOfPurchase)
        );
    }

    function AddTicketWithStruct(TicketStruct memory ticketToAdd)
        public
        returns (bool)
    {
        TicketStruct storage ticket = ticketStructs[ticketToAdd.token];

        ticket.dateOfPurchase = ticketToAdd.dateOfPurchase;
        ticket.token = ticketToAdd.token;

        TicketsArray.push(ticket);

        emit LogNewTicket(ticket.token, ticket.dateOfPurchase);

        return true;
    }

    function AddCustomerWithStruct(CustomerStruct memory customerToAdd)
        public
        returns (bool)
    {
        CustomerStruct storage customer = customerStructs[customerToAdd.token];

        customer.name = customerToAdd.name;
        customer.token = customerToAdd.token;

        for (uint256 i = 0; i < customerToAdd.tickets.length; i++) {
            customer.tickets.push(
                TicketStruct(
                    customerToAdd.token,
                    customerToAdd.tickets[i].dateOfPurchase
                )
            );
        }

        CustomersArray.push(customer);

        emit LogNewCustomer(
            customer.token,
            customer.name,
            customerToAdd.tickets
        );

        return true;
        //["0x8B8F4122f920F03d76Ea36a85FE6e53099f84124", "Test customer", [["0x8B8F4122f920F03d76Ea36a85FE6e53099f84124",1646803656]]]
    }

    function GetCustomerTickets(address token)
        public
        view
        returns (TicketStruct[] memory tickets)
    {
        CustomerStruct storage customer = customerStructs[token];
        return customer.tickets;
    }

    function TicketExists(address token) private view returns (bool) {
        return (customerStructs[token].token == token);
    }

    function GetTicketsArray() public view returns (TicketStruct[] memory) {
        return TicketsArray;
    }
}
