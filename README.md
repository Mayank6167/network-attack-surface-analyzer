# Enhancing Nmap HTTP Title Analysis Using Custom NSE Scripts

**Author:** Mayank Raj

## 1. Introduction

Nmap (Network Mapper) is an open-source network exploration and security auditing tool used to discover hosts, ports, and services on computer networks. The Nmap Scripting Engine (NSE) extends Nmap's functionality through scripts written in Lua.

The existing `http-title.nse` script retrieves the title of a web page hosted on an HTTP service. This project uses that script as the reference for developing two enhanced HTTP analysis scripts.

The enhancements extend page-title reporting by adding HTTP response metadata and supporting the analysis of multiple user-specified page paths.

## 2. Project Objectives

- Study the functionality of the existing Nmap `http-title.nse` script.
- Develop two enhanced scripts based on its page-title analysis functionality.
- Display HTTP status codes and content types alongside page titles.
- Analyze multiple user-specified page paths in one scan.
- Present results in a structured and readable format.
- Practise Lua programming and Nmap NSE script execution.

## 3. Reference Script

**Script:** `http-title.nse`

**Official source:** https://github.com/nmap/nmap/blob/master/scripts/http-title.nse

### Description

The original script retrieves a web page and extracts the text inside its HTML title element. It uses Nmap's HTTP library to request the page and supports URL-path customization and redirect handling.

### Example Output

```text
PORT   STATE SERVICE
80/tcp open  http
|_http-title: Example Domain
```

This is an illustrative example of the output format. Actual results depend on the target server.

## 4. Enhancement Option 1: HTTP Response Metadata

**Filename:** `http-title-metadata.nse`

### Description

This enhancement extends page-title analysis by displaying the HTTP status code and content type in addition to the page title.

### Features

- Retrieves an HTTP response using Nmap's HTTP library.
- Displays the requested page path.
- Reports the HTTP status code when available.
- Reports the content type when available.
- Extracts and displays the HTML page title.
- Handles responses without a recognizable title.

### Execution Command

```bash
nmap -p 80 --script ./http-title-metadata.nse <authorized-target>
```

To request a particular path:

```bash
nmap -p 80 --script ./http-title-metadata.nse --script-args 'http-title-metadata.url=/about' <authorized-target>
```

### Illustrative Output

```text
PORT   STATE SERVICE
80/tcp open  http
| http-title-metadata:
|   === HTTP Title Metadata ===
|   Requested Path : /
|   HTTP Status Code : 200
|   Content Type : text/html
|   Page Title : Example Domain
```

The output above is illustrative, not a verified scan result.

## 5. Enhancement Option 2: Multi-Page Title Analysis

**Filename:** `http-multi-page-title.nse`

### Description

This enhancement extends the original single-page analysis approach to multiple user-specified page paths. It accepts a comma-separated list of paths and reports the HTTP status code and page title for each response.

### Features

- Accepts multiple page paths through an NSE script argument.
- Requests each specified page.
- Reports the HTTP status code for each response when available.
- Extracts and displays each page's HTML title.
- Handles pages without a recognizable title.
- Presents results in a consistent format.

### Execution Command

```bash
nmap -p 80 --script ./http-multi-page-title.nse --script-args 'http-multi-page-title.paths="/,/about,/contact"' <authorized-target>
```

The example requests the root page and the `/about` and `/contact` paths. Use paths appropriate for your authorized test server.

### Illustrative Output

```text
PORT   STATE SERVICE
80/tcp open  http
| http-multi-page-title:
|   === Multi-Page HTTP Title Analysis ===
|
|   Requested Path : /
|   HTTP Status Code : 200
|   Page Title : Example Domain
|
|   Requested Path : /about
|   HTTP Status Code : 200
|   Page Title : About Us
|
|   Requested Path : /contact
|   HTTP Status Code : 404
|   Page Title : Not found
```

This example illustrates the output format. Actual status codes and page titles depend on the server responses.

## 6. Technologies Used

- **Nmap:** Network exploration and port scanning.
- **Nmap Scripting Engine:** Framework for executing custom scripts.
- **Lua:** Programming language used to implement the scripts.
- **Nmap HTTP library:** Used to request web pages and process HTTP responses.
- **GitHub:** Source-code hosting and project documentation.

## 7. Learning Outcomes

Through this project, I learned:

- How Nmap NSE scripts are structured.
- How to study an existing script before extending its functionality.
- How to use Lua to develop custom NSE scripts.
- How to retrieve HTTP responses using Nmap's HTTP library.
- How to extract page titles from HTML.
- How to display HTTP status codes and content types.
- How to pass script arguments through the Nmap command line.
- How to process multiple page paths in one script.
- How to organize output for readability.
- How to document and maintain scripts using GitHub.

## 8. Conclusion

This project demonstrates two enhancements to the page-title analysis functionality of Nmap's existing `http-title.nse` script.

The first enhancement adds HTTP response metadata, including the status code and content type. The second enhancement enables analysis of multiple user-specified page paths and reports the title and status code for each response.

These scripts demonstrate the use of Lua, Nmap's HTTP library, NSE script arguments, and structured output. They provide practical experience in extending existing network-analysis functionality.

The scripts should be tested only against systems for which authorization has been granted.

## 9. Acknowledgements

I would like to thank the School of Computer Science and Engineering (SCOPE), Vellore Institute of Technology, Chennai, for providing the opportunity to learn and practise cybersecurity concepts.

I acknowledge the Nmap project and its contributors for developing and maintaining Nmap, the Nmap Scripting Engine, and its supporting libraries.

Finally, I am grateful to the faculty, peers, and everyone who supported my learning and helped me complete this project.

## 10. References

- Nmap official website: https://nmap.org/
- Nmap Scripting Engine documentation: https://nmap.org/book/nse.html
- Original HTTP title script: https://github.com/nmap/nmap/blob/master/scripts/http-title.nse
